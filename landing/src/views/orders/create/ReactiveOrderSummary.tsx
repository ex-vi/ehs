"use client";

import dayjs from "dayjs";
import { FormikProps } from "formik";
import { useMemo } from "react";

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
  const formData: OrderFormData = useMemo(() => {
    return {
      service_type: formik.values.service_type,
      rooms: formik.values.rooms,
      bathrooms: formik.values.bathrooms,
      kitchens: formik.values.kitchens,
      building_type: formik.values.building_type,

      selected_date: formik.values.selected_date || dayjs().format("YYYY-MM-DD"),
      selected_time: formik.values.selected_time || "10:00",
      reconfirm: formik.values.reconfirm,

      frequency: formik.values.frequency as Cadence,
      frequency_discount: 0,

      selected_services: formik.values.selected_services,
      is_vacuum_selected: formik.values.is_vacuum_selected,

      address: {
        ...formik.values.address,
        landmarks: "",
      },

      contact: formik.values.contact,

      square_feet: formik.values.square_feet,
      windows: formik.values.windows,

      renovation_services: formik.values.renovation_services,

      payment_method: formik.values.payment_method,
      vat_info: formik.values.vat_info,
      agreements: formik.values.agreements,
    };
  }, [formik.values]);

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
