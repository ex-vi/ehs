"use client";

import { useFormik } from "formik";

import { CreateOrderRequest, formConfig } from "@/core/forms/orders/create";
import { ordersTranslation } from "@/core/translations/orders";
import { Card } from "@/components/ui/card";

import FixedBreadcrumbs from "../FixedBreadcrumbs";
import OrderForm from "../OrderForm";
import ReactiveOrderSummary from "../ReactiveOrderSummary";
import { calculateOrderClient, OrderFormData } from "./calculations";
import { transformOrderData } from "./transformedData";

export default function CreateOrderPage({
  orderFormData,
  searchParams,
  onSubmit,
}: {
  orderFormData: OrderFormData;
  searchParams: Record<string, string>;
  onSubmit: (data: CreateOrderRequest) => Promise<void>;
}) {
  const services = orderFormData.services ?? [];
  const addons = orderFormData.addons ?? [];
  const coefficients = orderFormData.coefficients ?? [];
  const tax = orderFormData.tax ?? null;

  const formik = useFormik(
    formConfig({
      onSubmit: async (values, formikHelpers) => {
        try {
          const orderFormData = {
            service_type: values.service_type,
            rooms: values.rooms,
            bathrooms: values.bathrooms,
            kitchens: values.kitchens,
            building_type: values.building_type,
            selected_date: values.selected_date,
            selected_time: values.selected_time,
            reconfirm: values.reconfirm,
            frequency: values.frequency,
            frequency_discount: 0,
            selected_services: values.selected_services,
            is_vacuum_selected: values.is_vacuum_selected,
            address: {
              street: values.address.street,
              unit: values.address.unit,
              city: values.address.city,
              province: values.address.province,
              entry_instructions: values.address.entry_instructions,
              landmarks: "",
            },
            contact: values.contact,
            square_feet: values.square_feet,
            windows: values.windows,
            payment_method: values.payment_method,
            agreements: values.agreements,
            vat_info: values.vat_info,
            renovation_services: values.renovation_services,
          };

          const requestData = transformOrderData(orderFormData, services, coefficients, addons, tax);

          await onSubmit(requestData);
        } catch (error) {
          console.error("Order submission error:", error);
        } finally {
          formikHelpers.setSubmitting(false);
        }
      },
      searchParams,
    })
  );

  const currentOrderFormData = {
    service_type: formik.values.service_type,
    rooms: formik.values.rooms,
    bathrooms: formik.values.bathrooms,
    kitchens: formik.values.kitchens,
    building_type: formik.values.building_type,
    selected_date: formik.values.selected_date,
    selected_time: formik.values.selected_time,
    reconfirm: formik.values.reconfirm,
    frequency: formik.values.frequency,
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
    payment_method: formik.values.payment_method,
    agreements: formik.values.agreements,
    vat_info: formik.values.vat_info,
    renovation_services: formik.values.renovation_services,
  };

  const requestForCalculation = transformOrderData(currentOrderFormData, services, coefficients, addons, tax);
  const calculation = calculateOrderClient(requestForCalculation, services, addons, coefficients, tax);
  const total = calculation.total;

  return (
    <section className="bg-background section-padding-y relative">
      <div className="container-padding-x z-10000 container mx-auto flex w-full flex-col pt-4 max-lg:gap-0 md:pt-6">
        <div className="section-title-gap-lg hidden w-full flex-col max-lg:sticky max-lg:top-16 max-lg:z-100 max-lg:pb-10 lg:flex">
          <h2 className="heading-lg">{ordersTranslation.yourOrder.title}</h2>
        </div>

        <div className="grid grid-cols-1 gap-8 lg:grid-cols-3">
          <div className="space-y-12 lg:col-span-2">
            <FixedBreadcrumbs total={total} />
            <OrderForm
              services={orderFormData.services || []}
              addons={orderFormData.addons || []}
              coefficients={orderFormData.coefficients || []}
              tax={orderFormData.tax}
              formik={formik}
            />
          </div>

          <Card className="sticky top-16 h-fit overflow-hidden rounded-xl p-0 md:top-19 lg:col-span-1">
            <ReactiveOrderSummary
              formik={formik}
              services={orderFormData.services || []}
              addons={orderFormData.addons || []}
              coefficients={orderFormData.coefficients || []}
              tax={orderFormData.tax}
            />
          </Card>
        </div>
      </div>
    </section>
  );
}
