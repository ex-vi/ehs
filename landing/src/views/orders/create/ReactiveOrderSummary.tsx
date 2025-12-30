"use client";

import dayjs from "dayjs";
import { FormikProps } from "formik";
import { useEffect, useState } from "react";
import { useParams, useSearchParams } from "next/navigation";

import { CreateOrderFormValues } from "@/core/forms/orders/create";
import type { Addon } from "@/core/models/addons";
import type { Coefficient } from "@/core/models/coefficients";
import type { Cadence, OrderFormData } from "@/core/models/orders";
import type { Service } from "@/core/models/services";
import type { Tax } from "@/core/models/tax";

import OrderSummary from "./OrderSummary";

interface ReactiveOrderSummaryProps {
  className?: string;
  services: Service[];
  addons: Addon[];
  coefficients: Coefficient[];
  tax?: Tax | null;
  onOrderSuccess?: () => void;
  formik: FormikProps<CreateOrderFormValues>;
}

export default function ReactiveOrderSummary({
  className,
  services,
  addons,
  coefficients,
  tax,
  onOrderSuccess,
  formik,
}: ReactiveOrderSummaryProps) {
  const params = useParams<{ service: string }>();
  const searchParams = useSearchParams();
  const [formData, setFormData] = useState<OrderFormData>(() => {
    const getServiceFromUrl = () => {
      const serviceParam = params.service;
      if (serviceParam) {
        const found = services.find((s) => s.slug === serviceParam);
        if (found) return found.slug;
      }

      const serviceSearchParam = searchParams.get("service");
      if (serviceSearchParam) {
        const found = services.find((s) => s.slug === serviceSearchParam);
        if (found) return found.slug;
      }

      const serviceTypeParam = searchParams.get("serviceType");
      if (serviceTypeParam) {
        const found = services.find((s) => s.name === serviceTypeParam || s.slug === serviceTypeParam);
        if (found) return found.slug;
      }

      return services[0]?.slug || "standard";
    };

    const baseFormData: OrderFormData = {
      service_type: getServiceFromUrl(),
      rooms: parseInt(searchParams.get("rooms") || "1", 10),
      bathrooms: parseInt(searchParams.get("bathrooms") || "1", 10),
      kitchens: parseInt(searchParams.get("kitchens") || "1", 10),
      building_type: (searchParams.get("buildingType") as "Apartment" | "House") || "Apartment",
      selected_date: searchParams.get("date") || dayjs().format("YYYY-MM-DD"),
      selected_time: searchParams.get("time") || "10:00",
      reconfirm: searchParams.get("reconfirm") === "true",
      frequency: (searchParams.get("frequency") as Cadence) || "discount-once",
      frequency_discount: 0,
      selected_services: {},
      is_vacuum_selected: searchParams.get("vacuum") === "true",
      address: {
        street: searchParams.get("street") || "",
        unit: searchParams.get("unit") || "",
        city: searchParams.get("city") || "",
        province: searchParams.get("province") || "",
        entry_instructions: searchParams.get("entry_instructions") || "",
        landmarks: "",
      },
      contact: {
        first_name: searchParams.get("first_name") || "",
        last_name: searchParams.get("last_name") || "",
        email: searchParams.get("email") || "",
        phone: searchParams.get("phone") || "",
        other_instructions: searchParams.get("other_instructions") || "",
      },
      payment_method: searchParams.get("paymentMethod") || "Cash or card on site",
      agreements: {
        terms: searchParams.get("terms") === "true",
        consent: searchParams.get("consent") === "true",
        create_profile: searchParams.get("create_profile") === "true",
      },
      vat_info: {
        company_name: searchParams.get("company_name") || "",
        vat_number: searchParams.get("vat_number") || "",
        billing_address: searchParams.get("billing_address") || "",
        invoice_email: searchParams.get("invoice_email") || "",
        contact_person: searchParams.get("contact_person") || "",
        phone_number: searchParams.get("phone_number") || "",
      },
    };

    Array.from(searchParams.keys()).forEach((key) => {
      if (key.startsWith("addon_")) {
        const addonName = key.replace("addon_", "").replace(/_/g, " ");
        const quantity = parseInt(searchParams.get(key) || "0", 10);
        if (quantity > 0) {
          baseFormData.selected_services[addonName] = quantity;
        }
      }
    });

    return baseFormData;
  });

  useEffect(() => {
    const handleFormChange = (event: CustomEvent) => {
      setFormData(event.detail);
    };

    window.addEventListener("orderFormChange", handleFormChange as EventListener);

    return () => {
      window.removeEventListener("orderFormChange", handleFormChange as EventListener);
    };
  }, []);

  return (
    <OrderSummary
      formik={formik}
      className={className}
      formData={formData}
      services={services}
      addons={addons}
      coefficients={coefficients}
      tax={tax}
      onOrderSuccess={onOrderSuccess}
      showButton
    />
  );
}
