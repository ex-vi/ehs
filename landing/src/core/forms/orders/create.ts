import { FormikConfig, FormikHelpers } from "formik";
import * as Yup from "yup";

import { Cadence, OrderStatus } from "@/core/models/orders";

export type CreateOrderRequest = {
  datetime: string;
  meta: {
    is_vacuum_selected?: boolean;
    status: OrderStatus;
    service: {
      slug: string;
      name: string;
      price: number;
    };
    property: "apartment" | "house";
    extra_rooms: number;
    extra_bathrooms: number;
    extra_kitchens: number;
    windows: number;
    reconfirm: boolean;
    cadence: Cadence;
    addons: Array<{
      name: string;
      count: number;
      price: number;
    }>;
    square_feet: number;
    address: {
      street: string;
      unit: string;
      city: string;
      province: string;
      entry_instructions: string;
    };
    contacts: {
      first_name: string;
      last_name: string;
      email: string;
      phone: string;
      other_instructions: string;
    };
    payment: {
      method: "cash" | "online" | "invoice";
      status: "paid" | "unpaid";
    };
    marketing_consent: boolean;
    create_profile: boolean;
    estimated_hours: number;
    client_estimated_hours?: number;
    total: number;
    vat_rate?: number;
    vat_amount?: number;
    vat_info?: {
      company_name: string;
      vat_number: string;
      billing_address: string;
      invoice_email: string;
      contact_person: string;
      phone_number: string;
    };
    // TEMPORARY: Renovation services support - can be easily removed
    renovation_services?: Record<string, import("@/core/models/services").Service & { sqft: number }>;
  };
};

export type CreateOrderFormValues = {
  service_type: string;
  rooms: number;
  bathrooms: number;
  kitchens: number;
  windows: number;
  square_feet: string;
  building_type: "Apartment" | "House";
  selected_date: string;
  selected_time: string;
  reconfirm: boolean;
  frequency: Cadence;
  selected_services: Record<string, number>;
  is_vacuum_selected: boolean;
  address: {
    street: string;
    unit: string;
    city: string;
    province: string;
    entry_instructions: string;
    zip_code: string;
  };
  contact: {
    first_name: string;
    last_name: string;
    email: string;
    phone: string;
    other_instructions: string;
  };
  payment_method: string;
  vat_info: {
    company_name: string;
    vat_number: string;
    billing_address: string;
    invoice_email: string;
    contact_person: string;
    phone_number: string;
  };
  agreements: {
    terms: boolean;
    consent: boolean;
    create_profile: boolean;
  };
  // TEMPORARY: Renovation services support - can be easily removed
  renovation_services?: Record<string, import("@/core/models/services").Service & { sqft: number }>;
};

type FormConfigProps = {
  onSubmit: (values: CreateOrderFormValues, formikHelpers: FormikHelpers<CreateOrderFormValues>) => void | Promise<any>;
  searchParams?: Record<string, string>;
};

export const formConfig = ({ onSubmit, searchParams }: FormConfigProps): FormikConfig<CreateOrderFormValues> => ({
  initialValues: createInitialValues(searchParams || {}),
  enableReinitialize: true,
  validationSchema,
  onSubmit,
});

const validationSchema = Yup.object({
  service_type: Yup.string().required(),
  rooms: Yup.number().min(0).required(),
  bathrooms: Yup.number().min(0).required(),
  kitchens: Yup.number().min(0).required(),
  windows: Yup.number().min(0).required(),
  square_feet: Yup.string(),
  building_type: Yup.mixed<"Apartment" | "House">().oneOf(["Apartment", "House"]).required(),
  selected_date: Yup.string().required(),
  selected_time: Yup.string().required(),
  reconfirm: Yup.boolean().required(),
  frequency: Yup.mixed<Cadence>()
    .oneOf(["discount-once", "discount-weekly", "discount-biweekly", "discount-monthly"])
    .required(),
  selected_services: Yup.object().required(),
  is_vacuum_selected: Yup.boolean().required(),
  address: Yup.object({
    street: Yup.string().required(),
    unit: Yup.string(),
    city: Yup.string().required(),
    province: Yup.string().required(),
    entry_instructions: Yup.string(),
  }),
  contact: Yup.object({
    first_name: Yup.string().required(),
    last_name: Yup.string().required(),
    email: Yup.string().email().required(),
    phone: Yup.string().required(),
    other_instructions: Yup.string(),
  }),
  payment_method: Yup.string().required(),
  vat_info: Yup.object({
    company_name: Yup.string(),
    vat_number: Yup.string(),
    billing_address: Yup.string(),
    invoice_email: Yup.string().email(),
    contact_person: Yup.string(),
    phone_number: Yup.string(),
  }),
  agreements: Yup.object({
    terms: Yup.boolean().oneOf([true], "You must accept the terms").required(),
    consent: Yup.boolean().required(),
    create_profile: Yup.boolean().required(),
  }),
  // TEMPORARY: Renovation services support - can be easily removed
  renovation_services: Yup.object().optional(),
});

const createInitialValues = (searchParams: Record<string, string>): CreateOrderFormValues => {
  const service_type = searchParams.service || searchParams.service_type || "standard";
  const isKitchen = service_type === "kitchen";
  const isWindows = service_type === "windows";
  const isOffice = service_type === "office";
  const isStaircases = service_type === "staircases";
  const isRenovations = service_type === "renovations";

  const defaultRooms = isKitchen || isWindows || isOffice || isStaircases || isRenovations ? "0" : "1";
  const defaultBathrooms = isKitchen || isWindows || isOffice || isStaircases || isRenovations ? "0" : "1";
  const defaultKitchens = isKitchen ? "1" : isWindows || isOffice || isStaircases || isRenovations ? "0" : "1";
  const defaultWindows = isWindows ? "5" : "0";
  const defaultSquareFeet = isOffice || isStaircases || isRenovations ? "0" : "";

  return {
    service_type,
    rooms: parseInt(searchParams.rooms || defaultRooms, 10),
    bathrooms: parseInt(searchParams.bathrooms || defaultBathrooms, 10),
    kitchens: parseInt(searchParams.kitchens || defaultKitchens, 10),
    windows: parseInt(searchParams.windows || defaultWindows, 10),
    square_feet: searchParams.square_feet ?? defaultSquareFeet,
    building_type: (searchParams.building_type as "Apartment" | "House") || "Apartment",
    selected_date:
      searchParams.date ||
      (() => {
        const d = new Date();
        d.setHours(12, 0, 0, 0);
        const y = d.getFullYear();
        const m = String(d.getMonth() + 1).padStart(2, "0");
        const day = String(d.getDate()).padStart(2, "0");
        return `${y}-${m}-${day}`;
      })(),
    selected_time: searchParams.time || "10:00",
    reconfirm: searchParams.reconfirm === "true",
    frequency: (searchParams.frequency as Cadence) || "discount-once",
    selected_services: Object.fromEntries(
      Object.entries(searchParams)
        .filter(([key]) => key.startsWith("addon_"))
        .map(([key, value]) => [key.replace("addon_", ""), parseInt(value as string, 10) || 1])
    ),
    is_vacuum_selected: searchParams.vacuum === "true",
    address: {
      street: searchParams.street || "",
      unit: searchParams.unit || "",
      city: searchParams.city || "",
      province: searchParams.province || "",
      entry_instructions: searchParams.entry_instructions || "",
      zip_code: searchParams.zip_code || "",
    },
    contact: {
      first_name: searchParams.first_name || "",
      last_name: searchParams.last_name || "",
      email: searchParams.email || "",
      phone: searchParams.phone || "",
      other_instructions: searchParams.other_instructions || "",
    },
    payment_method: searchParams.payment_method || "Cash or card on site",
    vat_info: {
      company_name: searchParams.company_name || "",
      vat_number: searchParams.vat_number || "",
      billing_address: searchParams.billing_address || "",
      invoice_email: searchParams.invoice_email || "",
      contact_person: searchParams.contact_person || "",
      phone_number: searchParams.phone_number || "",
    },
    agreements: {
      terms: false,
      consent: false,
      create_profile: false,
    },
    // TEMPORARY: Renovation services support - can be easily removed
    renovation_services: {},
  };
};
