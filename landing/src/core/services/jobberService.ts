import { fetchServices } from "@/core/api/services";
import { CreateOrderRequest } from "@/core/forms/orders/create";

import jobberClient from "./jobberClient";
import { jobberTokenManager } from "./jobberTokenManager";
import { CreateJobberOrderResult } from "./jobberTypes";

/**
 * Convert our order data to Jobber format and create a job
 */
export async function createJobberOrder(orderData: CreateOrderRequest): Promise<CreateJobberOrderResult> {
  try {
    const { meta, datetime } = orderData;

    // Fetch service pricing details (extra room/bath/kitchen unit prices come from Strapi)
    const services = await fetchServices();
    const selectedService = services.find((s) => s.slug === meta.service.slug);
    if (!selectedService) {
      console.warn(
        `Jobber: Service not found in Strapi for slug '${meta.service.slug}'. Extra line items may be missing.`
      );
    }

    // Get a valid access token (will refresh if needed)
    const accessToken = await jobberTokenManager.getValidAccessToken();

    // Step 1: Get or create the client
    const clientId = await jobberClient.getOrCreateClient(accessToken, {
      firstName: meta.contacts.first_name,
      lastName: meta.contacts.last_name,
      email: meta.contacts.email,
      phone: meta.contacts.phone,
    });

    // Step 2: Create property for the client if address is provided
    let propertyId: string | undefined;
    if (meta.address.street && meta.address.city) {
      propertyId = await jobberClient.createProperty(accessToken, {
        clientId,
        address: {
          street1: meta.address.street,
          street2: meta.address.unit || undefined,
          city: meta.address.city,
          province: meta.address.province,
          postalCode: undefined, // Not in our current schema
        },
      });
    }

    // Step 3: Build line items from service, additional rooms/baths/kitchens, and addons
    const hasBaseRooms = ["standard", "deep", "move-in", "after-renovation"].includes(meta.service.slug);
    const isStairwellsService = meta.service.slug === "staircases";
    const isOfficeService = meta.service.slug === "office";
    const isWindowsService = meta.service.slug === "windows";
    const isKitchenService = meta.service.slug === "kitchen";
    const isRenovationsService = meta.service.slug === "renovations";

    const excludeRoomsCost = isStairwellsService || isOfficeService || isWindowsService || isRenovationsService;
    const excludeBathroomKitchenCost = isStairwellsService || isWindowsService || isRenovationsService;

    const chargeableRooms = excludeRoomsCost ? 0 : hasBaseRooms ? Math.max(0, meta.extra_rooms - 1) : meta.extra_rooms;
    const chargeableBathrooms = excludeBathroomKitchenCost
      ? 0
      : hasBaseRooms
        ? Math.max(0, meta.extra_bathrooms - 1)
        : meta.extra_bathrooms;
    const chargeableKitchens = excludeBathroomKitchenCost
      ? 0
      : hasBaseRooms || isKitchenService
        ? Math.max(0, meta.extra_kitchens - 1)
        : meta.extra_kitchens;

    const lineItems = [
      {
        name: meta.service.name,
        description: `${meta.property === "house" ? "House" : "Apartment"} cleaning - ${meta.cadence}`,
        unitCost: meta.service.price,
        quantity: 1,
      },
      ...(chargeableRooms > 0
        ? [
            {
              name: "Extra Rooms",
              description: "",
              unitCost: selectedService?.extra_bedroom_price ?? 0,
              quantity: chargeableRooms,
            },
          ]
        : []),
      ...(chargeableBathrooms > 0
        ? [
            {
              name: "Extra Bathrooms",
              description: "",
              unitCost: selectedService?.extra_bathroom_price ?? 0,
              quantity: chargeableBathrooms,
            },
          ]
        : []),
      ...(chargeableKitchens > 0
        ? [
            {
              name: "Extra Kitchens",
              description: "",
              unitCost: selectedService?.extra_kitchen_price ?? 0,
              quantity: chargeableKitchens,
            },
          ]
        : []),
      ...meta.addons.map((addon) => ({
        name: addon.name,
        description: "",
        unitCost: addon.price,
        quantity: addon.count,
      })),
    ];

    // Step 4: Create the job
    const job = await jobberClient.createJob(accessToken, {
      clientId,
      propertyId,
      title: `${meta.service.name} - ${meta.contacts.first_name} ${meta.contacts.last_name}`,
      description: buildJobDescription(orderData),
      startAt: datetime,
      lineItems,
    });

    return {
      success: true,
      jobId: job.id,
      jobNumber: job.jobNumber,
      data: job,
    };
  } catch (error: any) {
    console.error("Failed to create Jobber order:", error);
    return {
      success: false,
      error: error.message || "Failed to create order in Jobber",
    };
  }
}

/**
 * Build a detailed job description from order data
 */
function buildJobDescription(orderData: CreateOrderRequest): string {
  const { meta } = orderData;

  const parts = [
    `Property Type: ${meta.property === "house" ? "House" : "Apartment"}`,
    `Rooms: ${meta.extra_rooms}`,
    `Bathrooms: ${meta.extra_bathrooms}`,
    `Kitchens: ${meta.extra_kitchens}`,
    meta.windows ? `Windows: ${meta.windows}` : null,
    meta.square_feet ? `Square Feet: ${meta.square_feet}` : null,
    `Frequency: ${meta.cadence}`,
    meta.reconfirm ? "Requires reconfirmation" : null,
    meta.is_vacuum_selected ? "Vacuum cleaner included" : null,
  ];

  if (meta.address.entry_instructions) {
    parts.push(`Entry Instructions: ${meta.address.entry_instructions}`);
  }

  if (meta.contacts.other_instructions) {
    parts.push(`Special Instructions: ${meta.contacts.other_instructions}`);
  }

  if (meta.addons.length > 0) {
    parts.push(`Add-ons: ${meta.addons.map((a) => `${a.name} (${a.count}x)`).join(", ")}`);
  }

  parts.push(`Payment Method: ${meta.payment.method}`);
  parts.push(`Total: $${meta.total.toFixed(2)}`);

  return parts.filter(Boolean).join("\n");
}
