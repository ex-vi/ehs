export type OrderStatus = "pending" | "in_progress" | "cancelled" | "rescheduled" | "done";
export type PropertyType = "apartment" | "house";
export type Cadence = "discount-once" | "discount-weekly" | "discount-biweekly" | "discount-monthly";
export type PaymentMethod = "cash" | "online" | "invoice";
export type PaymentStatus = "paid" | "unpaid";
export type FeedbackType = "good" | "average" | "bad" | null;

type BaseModel = {
  id: string;
  created_at: string;
  created_by: string;
  updated_at: string;
  updated_by: string;
  deleted_at: string;
  deleted_by: string;
};

export type Order = BaseModel & {
  number: string;
  datetime: string;
  meta: {
    status: OrderStatus;
    service: {
      slug: string;
      name: string;
      price: number;
    };
    property: PropertyType;
    extra_rooms: number;
    extra_bathrooms: number;
    extra_kitchens: number;
    reconfirm: boolean;
    cadence: Cadence;
    addons: Array<{
      name: string;
      count: number;
      price: number;
    }>;
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
    };
    other_instructions: string;
    payment: {
      method: PaymentMethod;
      status: PaymentStatus;
    };
    vat_info?: {
      company_name: string;
      vat_number: string;
      billing_address: string;
      invoice_email: string;
      contact_person: string;
      phone_number: string;
    };
    marketing_consent: boolean;
    create_profile: boolean;
    estimated_hours: number;
    client_estimated_hours?: number;
    total: number;
    // TEMPORARY: Renovation services support - can be easily removed
    renovation_services?: Record<string, import("./services").Service & { sqft: number }>;
    vat_rate?: number;
    vat_amount?: number;
    square_feet?: number;
    windows?: number;
    assigned_user?: {
      id: string;
      created_at: string;
      name: string;
      username: string;
      role: string;
    };
    feedback?: FeedbackType;
  };
};

export interface OrderFormData {
  service_type: string;
  rooms: number;
  bathrooms: number;
  kitchens: number;
  building_type: "Apartment" | "House";

  selected_date: string | null;
  selected_time: string | null;
  reconfirm: boolean;

  frequency: Cadence;
  frequency_discount: number;

  selected_services: Record<string, number>;
  is_vacuum_selected: boolean;

  address: {
    street: string;
    unit: string;
    city: string;
    province: string;
    entry_instructions: string;
    landmarks: string;
  };

  contact: {
    first_name: string;
    last_name: string;
    email: string;
    phone: string;
    other_instructions: string;
  };

  square_feet?: string;
  windows?: number;

  // TEMPORARY: Renovation services support - can be easily removed
  renovation_services?: Record<string, import("./services").Service & { sqft: number }>;

  payment_method: string | null;
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
}
