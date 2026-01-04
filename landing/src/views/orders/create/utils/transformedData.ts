import type { CreateOrderRequest } from "@/core/forms/orders/create";
import type { Addon } from "@/core/models/addons";
import type { Coefficient } from "@/core/models/coefficients";
import type { OrderFormData } from "@/core/models/orders";
import type { Service } from "@/core/models/services";
import type { Tax } from "@/core/models/tax";
import { calculateBothTimes } from "@/core/utils/timeCalculations";

import { calculateOrderClient } from "./calculations";

export function transformOrderData(
  formData: OrderFormData,
  services: Service[],
  coefficients: Coefficient[],
  addons: Addon[],
  tax?: Tax | null
): CreateOrderRequest {
  const getDateTime = (date: string | null, time: string | null): string => {
    if (!date) return new Date().toISOString();
    if (!time) return new Date(`${date}T10:00:00.000Z`).toISOString();
    return new Date(`${date}T${time}:00.000Z`).toISOString();
  };

  const timeCalculations = calculateBothTimes(formData, services, addons);

  const selectedService = services.find((s) => s.slug === formData.service_type);

  const req: CreateOrderRequest = {
    datetime: getDateTime(formData.selected_date, formData.selected_time),
    meta: {
      status: "pending",
      service: {
        slug: formData.service_type,
        name: selectedService?.name || formData.service_type,
        price: selectedService?.service_price || 0,
      },
      property: formData.building_type.toLowerCase() as "apartment" | "house",
      extra_rooms: formData.rooms,
      extra_bathrooms: formData.bathrooms,
      extra_kitchens: formData.kitchens,
      windows: formData.windows ?? 5,
      reconfirm: formData.reconfirm,
      cadence: formData.frequency,
      addons: Object.entries(formData.selected_services)
        .filter(([_, count]) => count > 0)
        .map(([slug, count]) => {
          const addon = addons.find((a) => a.slug === slug);
          return {
            name: addon ? addon.name : slug,
            count,
            price: addon ? addon.price : 0,
          };
        }),
      square_feet: parseInt(formData.square_feet || "0", 10),
      address: formData.address,
      contacts: formData.contact,
      payment: {
        method: formData.payment_method?.toLowerCase().includes("cash")
          ? "cash"
          : formData.payment_method?.toLowerCase().includes("invoice")
            ? "invoice"
            : "online",
        status: "unpaid",
      },
      marketing_consent: formData.agreements.consent,
      create_profile: formData.agreements.create_profile,
      estimated_hours: timeCalculations.workerTime,
      client_estimated_hours: timeCalculations.clientTime,
      total: 0,
      is_vacuum_selected: formData.is_vacuum_selected,
      // TEMPORARY: Renovation services support - can be easily removed
      renovation_services: formData.renovation_services || undefined,
    },
  };

  if (formData.is_vacuum_selected) {
    const vacuumAddon = addons.find((a) => a.slug === "vacuum-cleaner");
    if (vacuumAddon) {
      req.meta.addons.push({
        name: "Vacuum cleaner",
        count: 1,
        price: vacuumAddon.price,
      });
    }
  }

  const calculation = calculateOrderClient(req, services, addons, coefficients, tax);
  req.meta.total = calculation.total;
  req.meta.vat_rate = tax?.vat || 0;
  req.meta.vat_amount = calculation.vatAmount;

  if (formData.payment_method?.toLowerCase().includes("invoice")) {
    req.meta.vat_info = formData.vat_info;
  }

  return req;
}
