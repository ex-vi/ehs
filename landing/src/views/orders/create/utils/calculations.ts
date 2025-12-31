import { fetchAddons } from "@/core/api/addons";
import { fetchCoefficients } from "@/core/api/coefficients";
import { fetchServices } from "@/core/api/services";
import { fetchTax } from "@/core/api/tax";
import { SERVICES_WITH_BASE_ROOMS, SERVICES_WITH_DISCOUNTS } from "@/core/constants/common";
import type { CreateOrderRequest } from "@/core/forms/orders/create";
import type { Addon } from "@/core/models/addons";
import type { Coefficient } from "@/core/models/coefficients";
import type { Service } from "@/core/models/services";
import type { Tax } from "@/core/models/tax";
import { applyCoefficient, getDiscountPercentageFromCoefficient } from "@/core/utils/getCoefficient";

// import { renovationServices } from "../RenovationServices"; // ВРЕМЕННО: моки убраны
// TEMPORARY: Renovation services support - can be easily removed
import { calculateRenovationServices, type RenovationServicesTotal } from "./renovationCalculations";

export interface ClientCalculationResult {
  baseCost: number;
  addonsCost: number;
  subtotal: number;
  frequencyDiscount: number;
  discountAmount: number;
  afterDiscount: number;
  vatAmount: number;
  total: number;
  breakdown: {
    service: {
      total: number;
      name: string;
      price: number;
      items: Array<{
        name: string;
        quantity: number;
        unitPrice: number;
        total: number;
      }>;
    };
    addOns: {
      total: number;
      items: Array<{
        name: string;
        quantity: number;
        unitPrice: number;
        total: number;
      }>;
    };
    frequency: {
      name: string;
      discount: number;
      discountAmount: number;
      finalAmount: number;
    } | null;
    location: {
      name: string;
      discount: number;
    } | null;
    // TEMPORARY: Renovation services support - can be easily removed
    renovations?: RenovationServicesTotal;
  };
}

export function calculateOrderClient(
  req: CreateOrderRequest,
  services: Service[],
  addons: Addon[],
  coefficients: Coefficient[],
  tax?: Tax | null
): ClientCalculationResult {
  const selectedService = services.find((s) => s.slug === req.meta.service.slug);

  if (!selectedService) {
    return {
      baseCost: 0,
      addonsCost: 0,
      subtotal: 0,
      frequencyDiscount: 0,
      discountAmount: 0,
      afterDiscount: 0,
      vatAmount: 0,
      total: 0,
      breakdown: {
        service: { total: 0, name: "", price: 0, items: [] },
        addOns: { total: 0, items: [] },
        frequency: null,
        location: null,
      },
    };
  }

  const baseCost = selectedService.service_price || 0;

  const isStairwellsService = selectedService.slug === "staircases";
  const isOfficeService = selectedService.slug === "office";
  const isWindowsService = selectedService.slug === "windows";
  const isKitchenService = selectedService.slug === "kitchen";
  const isRenovationsService = selectedService.slug === "renovations";

  let squareFeetCost = 0;
  if (selectedService.sqft_price) {
    const rawSquareFeet = req.meta.square_feet;
    const parsedSquareFeet = typeof rawSquareFeet === "string" ? Number(rawSquareFeet) : (rawSquareFeet ?? 0);
    const squareFeet = Number.isFinite(parsedSquareFeet) ? parsedSquareFeet : 0;

    if (isOfficeService || isStairwellsService) {
      // 0 sq ft should be treated as 0 cost (no forced minimum).
      squareFeetCost = squareFeet > 0 ? squareFeet * selectedService.sqft_price : 0;
    } else if (squareFeet > 0) {
      squareFeetCost = squareFeet * selectedService.sqft_price;
    }
  }

  const roomsCost = req.meta.extra_rooms * (selectedService.extra_bedroom_price || 0);
  const bathroomsCost = req.meta.extra_bathrooms * (selectedService.extra_bathroom_price || 0);
  const kitchensCost = req.meta.extra_kitchens * (selectedService.extra_kitchen_price || 0);
  const hasBaseRooms = SERVICES_WITH_BASE_ROOMS.includes(selectedService.slug as any);

  const excludeRoomsCost = isStairwellsService || isOfficeService || isWindowsService || isRenovationsService;
  const excludeBathroomKitchenCost = isStairwellsService || isWindowsService || isRenovationsService;

  const finalRoomsCost = excludeRoomsCost
    ? 0
    : hasBaseRooms
      ? Math.max(0, req.meta.extra_rooms - 1) * (selectedService.extra_bedroom_price || 0)
      : roomsCost;

  const finalBathroomsCost = excludeBathroomKitchenCost
    ? 0
    : hasBaseRooms
      ? Math.max(0, req.meta.extra_bathrooms - 1) * (selectedService.extra_bathroom_price || 0)
      : bathroomsCost;

  const finalKitchensCost = excludeBathroomKitchenCost
    ? 0
    : hasBaseRooms || isKitchenService
      ? Math.max(0, req.meta.extra_kitchens - 1) * (selectedService.extra_kitchen_price || 0)
      : kitchensCost;

  let windowsAdjustment = 0;
  let windowsTotal = 0;

  if (isWindowsService) {
    const windowUnitPrice = selectedService.service_price;
    windowsTotal = req.meta.windows * windowUnitPrice;
  }

  let serviceTotal;

  if (isWindowsService) {
    serviceTotal = windowsTotal;
  } else if (isStairwellsService) {
    serviceTotal = squareFeetCost;
  } else if (isOfficeService) {
    serviceTotal = squareFeetCost + finalBathroomsCost + finalKitchensCost;
  } else if (isRenovationsService) {
    // TEMPORARY: Renovations service - only base cost, no standard cleaning services
    serviceTotal = baseCost;
  } else {
    serviceTotal =
      baseCost + squareFeetCost + finalRoomsCost + finalBathroomsCost + finalKitchensCost + windowsAdjustment;
  }

  const locationCoeff = coefficients.find((c) => c.slug === "house");
  if (req.meta.property === "house" && locationCoeff) {
    serviceTotal = applyCoefficient(serviceTotal, locationCoeff.coefficient);
  }

  let frequencyDiscount = 0;
  let discountAmount = 0;
  let frequencyInfo: { name: string; discount: number; discountAmount: number; finalAmount: number } | null = null;

  const supportsDiscounts = SERVICES_WITH_DISCOUNTS.includes(selectedService.slug as any);
  const frequencySlug = req.meta.cadence || "discount-once";
  const freqCoeff = coefficients.find((c) => c.slug === frequencySlug);

  if (freqCoeff && supportsDiscounts) {
    const slugToNameMap: Record<string, string> = {
      "discount-weekly": "Once a week",
      "discount-biweekly": "Twice a month",
      "discount-monthly": "Monthly",
      "discount-once": "One-time",
    };

    if (freqCoeff.coefficient < 1) {
      frequencyDiscount = getDiscountPercentageFromCoefficient(freqCoeff.coefficient);
      discountAmount = serviceTotal * (1 - freqCoeff.coefficient);
    }

    frequencyInfo = {
      name: slugToNameMap[frequencySlug] || frequencySlug,
      discount: frequencyDiscount,
      discountAmount,
      finalAmount: 0,
    };
  }

  const afterFrequencyDiscountTotal = serviceTotal - discountAmount;

  let locationInfo: { name: string; discount: number } | null = null;
  let afterLocationTotal = afterFrequencyDiscountTotal;
  const cityName = req.meta.address?.city?.toLowerCase() || "";

  if (cityName) {
    const locationCoefficient = coefficients.find((c) => c.slug === cityName);

    if (locationCoefficient && locationCoefficient.coefficient !== 1) {
      afterLocationTotal = applyCoefficient(afterFrequencyDiscountTotal, locationCoefficient.coefficient);

      const locationDiscount =
        locationCoefficient.coefficient > 1
          ? Math.round((locationCoefficient.coefficient - 1) * 100)
          : Math.round((1 - locationCoefficient.coefficient) * 100);

      locationInfo = {
        name: cityName,
        discount: locationDiscount,
      };
    } else {
      locationInfo = {
        name: cityName,
        discount: 0,
      };
    }
  }

  if (frequencyInfo) {
    frequencyInfo.finalAmount = afterLocationTotal;
  }

  const afterDiscountServiceTotal = afterLocationTotal;

  let addonsCost = 0;
  const addonItems: Array<{ name: string; quantity: number; unitPrice: number; total: number }> = [];

  req.meta.addons.forEach((addonData) => {
    const { name, count, price } = addonData;

    if (count > 0) {
      const itemTotal = price * count;
      addonsCost += itemTotal;
      addonItems.push({ name, quantity: count, unitPrice: price, total: itemTotal });
    }
  });

  // TEMPORARY: Calculate renovation services if present
  let renovationsTotal = 0;
  let renovationsBreakdown: RenovationServicesTotal | undefined;

  if (req.meta.renovation_services) {
    renovationsBreakdown = calculateRenovationServices(req.meta.renovation_services, []);
    renovationsTotal = renovationsBreakdown.totalAmount;
  }

  const subtotalBeforeVat = afterDiscountServiceTotal + addonsCost + renovationsTotal;
  const vatRate = (tax?.vat || 0) / 100;
  const vatAmount = subtotalBeforeVat * vatRate;
  const total = subtotalBeforeVat + vatAmount;

  const standardCleaningItems: Array<{ name: string; quantity: number; unitPrice: number; total: number }> = [];

  if (squareFeetCost > 0 || isOfficeService || isStairwellsService) {
    const rawSquareFeet = req.meta.square_feet;
    const parsedSquareFeet = typeof rawSquareFeet === "string" ? Number(rawSquareFeet) : (rawSquareFeet ?? 0);
    const squareFeet = Number.isFinite(parsedSquareFeet) ? parsedSquareFeet : 0;
    const effectiveSquareFeet = isOfficeService || isStairwellsService ? squareFeet : squareFeet;

    if (effectiveSquareFeet > 0 && squareFeetCost > 0) {
      standardCleaningItems.push({
        name: "Square Feet",
        quantity: effectiveSquareFeet,
        unitPrice: selectedService.sqft_price || 0,
        total: squareFeetCost,
      });
    }
  }

  if (req.meta.extra_rooms > 0 && !excludeRoomsCost) {
    if (hasBaseRooms) {
      if (req.meta.extra_rooms === 1) {
        standardCleaningItems.push({ name: "Room", quantity: 1, unitPrice: 0, total: 0 });
      } else if (req.meta.extra_rooms > 1) {
        const extraRooms = req.meta.extra_rooms - 1;
        standardCleaningItems.push({
          name: "Extra Rooms",
          quantity: extraRooms,
          unitPrice: selectedService.extra_bedroom_price || 0,
          total: finalRoomsCost,
        });
      }
    } else {
      standardCleaningItems.push({
        name: "Rooms",
        quantity: req.meta.extra_rooms,
        unitPrice: selectedService.extra_bedroom_price || 0,
        total: finalRoomsCost,
      });
    }
  }

  if (req.meta.extra_bathrooms > 0 && !excludeBathroomKitchenCost) {
    if (hasBaseRooms) {
      if (req.meta.extra_bathrooms === 1) {
        standardCleaningItems.push({ name: "Bathroom", quantity: 1, unitPrice: 0, total: 0 });
      } else if (req.meta.extra_bathrooms > 1) {
        const extraBathrooms = req.meta.extra_bathrooms - 1;
        standardCleaningItems.push({
          name: "Extra Bathrooms",
          quantity: extraBathrooms,
          unitPrice: selectedService.extra_bathroom_price || 0,
          total: finalBathroomsCost,
        });
      }
    } else {
      standardCleaningItems.push({
        name: "Bathrooms",
        quantity: req.meta.extra_bathrooms,
        unitPrice: selectedService.extra_bathroom_price || 0,
        total: finalBathroomsCost,
      });
    }
  }

  if (req.meta.extra_kitchens > 0 && !excludeBathroomKitchenCost) {
    if (hasBaseRooms || isKitchenService) {
      if (req.meta.extra_kitchens === 1) {
        standardCleaningItems.push({ name: "Kitchen", quantity: 1, unitPrice: 0, total: 0 });
      } else if (req.meta.extra_kitchens > 1) {
        const extraKitchens = req.meta.extra_kitchens - 1;
        standardCleaningItems.push({
          name: "Extra Kitchens",
          quantity: extraKitchens,
          unitPrice: selectedService.extra_kitchen_price || 0,
          total: finalKitchensCost,
        });
      }
    } else {
      standardCleaningItems.push({
        name: "Kitchens",
        quantity: req.meta.extra_kitchens,
        unitPrice: selectedService.extra_kitchen_price || 0,
        total: finalKitchensCost,
      });
    }
  }

  if (isWindowsService) {
    const windowUnitPrice = selectedService.service_price;

    standardCleaningItems.push({
      name: "Windows",
      quantity: req.meta.windows,
      unitPrice: windowUnitPrice,
      total: req.meta.windows * windowUnitPrice,
    });
  }

  return {
    baseCost: serviceTotal,
    addonsCost,
    subtotal: subtotalBeforeVat,
    frequencyDiscount,
    discountAmount,
    afterDiscount: subtotalBeforeVat,
    vatAmount,
    total,
    breakdown: {
      service: {
        total: serviceTotal,
        name: selectedService.name,
        price: selectedService.service_price,
        items: standardCleaningItems,
      },
      addOns: {
        total: addonsCost,
        items: addonItems,
      },
      frequency: frequencyInfo,
      location: locationInfo,
      // TEMPORARY: Renovation services support - can be easily removed
      renovations: renovationsBreakdown,
    },
  };
}
export interface OrderFormData {
  services: Service[];
  addons: Addon[];
  coefficients: Coefficient[];
  tax: Tax | null;
}

export async function getOrderFormData(): Promise<OrderFormData> {
  const [services, addons, coefficients, tax] = await Promise.all([
    fetchServices(),
    fetchAddons(),
    fetchCoefficients(),
    fetchTax(),
  ]);

  return {
    services,
    addons,
    coefficients,
    tax,
  };
}
