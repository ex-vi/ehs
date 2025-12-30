import { CreateOrderFormValues, CreateOrderRequest } from "@/core/forms/orders/create";

import { createOrder } from "../../fetchers";

const getDateTime = (datetime: string): string => {
  if (!datetime) {
    return new Date().toISOString();
  }

  if (!datetime.includes("T")) {
    return new Date(`${datetime}T10:00:00.000Z`).toISOString();
  }

  if (!datetime.endsWith(":00")) {
    return new Date(`${datetime}:00.000Z`).toISOString();
  }

  return new Date(`${datetime}.000Z`).toISOString();
};

export function convertFormValuesToRequest(
  values: CreateOrderFormValues,
  serviceData: {
    serviceName: string;
    servicePrice: number;
  },
  addonsData: Array<{ slug: string; name: string; price: number }>,
  calculatedData: {
    estimatedHours: number;
    clientEstimatedHours: number;
    total: number;
  }
): CreateOrderRequest {
  const convertPaymentMethod = (method: string): "cash" | "online" | "invoice" => {
    if (method.toLowerCase().includes("cash") || method === "Cash or card on site") {
      return "cash";
    }
    if (method.toLowerCase().includes("invoice")) {
      return "invoice";
    }
    return "online";
  };

  return {
    datetime: getDateTime(`${values.selected_date}T${values.selected_time}:00`),
    meta: {
      status: "pending",
      windows: values.windows,
      vat_info: values.vat_info,
      is_vacuum_selected: values.is_vacuum_selected,
      service: {
        slug: values.service_type,
        name: serviceData.serviceName,
        price: serviceData.servicePrice,
      },
      property: values.building_type.toLowerCase() === "house" ? "house" : "apartment",
      extra_rooms: values.rooms,
      extra_bathrooms: values.bathrooms,
      extra_kitchens: values.kitchens,
      reconfirm: values.reconfirm,
      cadence: values.frequency,
      addons: [
        ...Object.entries(values.selected_services)
          .filter(([_, quantity]) => quantity > 0)
          .map(([slug, count]) => {
            const addon = addonsData.find((a) => a.slug === slug);
            return {
              name: addon ? addon.name : slug,
              count,
              price: addon ? addon.price : 0,
            };
          }),
        ...(values.is_vacuum_selected
          ? [
              {
                name: "Vacuum Cleaner",
                count: 1,
                price: addonsData.find((a) => a.slug === "vacuum-cleaner")?.price || 0,
              },
            ]
          : []),
      ],
      square_feet: parseInt(values.square_feet || "0", 10),
      address: {
        street: values.address.street,
        unit: values.address.unit,
        city: values.address.city,
        province: values.address.province,
        entry_instructions: values.address.entry_instructions,
      },
      contacts: {
        first_name: values.contact.first_name,
        last_name: values.contact.last_name,
        email: values.contact.email,
        phone: values.contact.phone,
        other_instructions: values.contact.other_instructions,
      },
      payment: {
        method: convertPaymentMethod(values.payment_method),
        status: "unpaid",
      },
      marketing_consent: values.agreements.consent,
      create_profile: values.agreements.create_profile,
      estimated_hours: calculatedData.estimatedHours,
      client_estimated_hours: calculatedData.clientEstimatedHours,
      total: calculatedData.total,
      ...(convertPaymentMethod(values.payment_method) === "invoice" && {
        vat_info: {
          company_name: values.vat_info.company_name,
          vat_number: values.vat_info.vat_number,
          billing_address: values.vat_info.billing_address,
          invoice_email: values.vat_info.invoice_email,
          contact_person: values.vat_info.contact_person,
          phone_number: values.vat_info.phone_number,
        },
      }),
    },
  };
}

export async function submitOrderFromFormik(requestData: CreateOrderRequest): Promise<any> {
  try {
    const result = await createOrder(requestData);
    if (result.success) {
      return { success: true, data: result.data };
    } else {
      return { success: false, errors: result.fieldErrors || [result.error] };
    }
  } catch (error) {
    console.error("Error creating order:", error);
    return { success: false, errors: ["Error creating order"] };
  }
}
