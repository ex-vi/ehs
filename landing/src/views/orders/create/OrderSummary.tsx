"use client";

import dayjs from "dayjs";
import { FormikProps } from "formik";
import { Banknote, CreditCard } from "lucide-react";

import { BUSINESS_SERVICE_ORDER } from "@/core/constants/common";
import { CreateOrderFormValues } from "@/core/forms/orders/create";
import { cn } from "@/core/lib/utils";
import type { Addon } from "@/core/models/addons";
import type { Coefficient } from "@/core/models/coefficients";
import type { OrderFormData } from "@/core/models/orders";
import type { Service } from "@/core/models/services";
import type { Tax } from "@/core/models/tax";
import { commonTranslation } from "@/core/translations/common";
import { ordersTranslation } from "@/core/translations/orders";
import { Button } from "@/components/ui/button";
import { Separator } from "@/components/ui/separator";

import { calculateOrderClient } from "./utils/calculations";
import { transformOrderData } from "./utils/transformedData";

interface OrderSummaryProps {
  className?: string;
  formData: OrderFormData;
  services: Service[];
  addons: Addon[];
  coefficients: Coefficient[];
  tax?: Tax | null;
  onOrderSuccess?: () => void;
  showButton?: boolean;
  formik: FormikProps<CreateOrderFormValues>;
}

export default function OrderSummary({
  className,
  formData,
  services,
  addons,
  coefficients,
  tax,
  onOrderSuccess,
  showButton = true,
  formik,
}: OrderSummaryProps) {
  const request = transformOrderData(formData, services, coefficients, addons, tax);
  const calculation = calculateOrderClient(request, services, addons, coefficients, tax);

  const selectedService = services.find((s) => s.slug === formData.service_type);

  const PaymentIcon =
    /cash/i.test(formData.payment_method || "") || /on-?site/i.test(formData.payment_method || "")
      ? Banknote
      : CreditCard;

  const formatPrice = (value: number | null | undefined) => {
    if (!value || isNaN(value)) return `0.00 ${commonTranslation.cad}`;
    return `${value.toFixed(2)} ${commonTranslation.cad}`;
  };

  const dateStr = formData.selected_date ? dayjs(formData.selected_date).format("MMMM D, YYYY") : "";

  return (
    <div id="summary" className={cn("bg-background rounded-xl border shadow-sm", className)}>
      <div className="bg-muted/60 flex w-full gap-2 px-6 py-4">
        <div className="flex-1">
          <h3 className="text-lg font-semibold">{ordersTranslation.summaryTranslation.title}</h3>
          <p className="text-muted-foreground mt-1 text-sm">{dateStr}</p>
        </div>
        <div>
          <p className="text-end text-lg font-semibold">{ordersTranslation.summaryTranslation.total}</p>
          <p className="text-muted-foreground mt-1 text-sm">{formatPrice(calculation.total)}</p>
        </div>
      </div>

      <div className="p-6">
        <div className="space-y-3">
          <section className="space-y-1">
            <h4 className="text-sm font-semibold">{ordersTranslation.summaryTranslation.orderDetails}</h4>
            <div className="flex items-start justify-between">
              <span className="text-sm">{selectedService?.name || formData.service_type}</span>
              {(calculation.breakdown.service.price || 0) > 0 && (
                <span className="text-sm font-medium">{formatPrice(calculation.breakdown.service.price || 0)}</span>
              )}
            </div>

            <div className="text-muted-foreground mt-1 ml-4 space-y-1 text-sm">
              {calculation.breakdown.service.items.map((item, index) => (
                <div key={index} className="flex justify-between">
                  <span>{item.name}</span>
                  {item.unitPrice > 0 && (
                    <span>
                      {item.quantity} × {formatPrice(item.unitPrice)}
                    </span>
                  )}
                </div>
              ))}
              {calculation.breakdown.renovations && calculation.breakdown.renovations.services.length > 0 && (
                <section className="space-y-1">
                  {calculation.breakdown.renovations.services.map((service) => (
                    <div key={service.id} className="space-y-1">
                      <div className="flex justify-between text-sm">
                        <div className="flex-1">
                          <div className="flex items-center gap-1">
                            <span>{service.title}</span>
                          </div>
                        </div>
                        <span>
                          {service.sqft} sq ft × {formatPrice(service.unitPrice)}
                        </span>
                      </div>
                    </div>
                  ))}
                </section>
              )}
            </div>
          </section>

          {calculation.breakdown.addOns.items.length > 0 && (
            <section className="space-y-1">
              <h4 className="text-sm font-semibold">{ordersTranslation.summaryTranslation.addOns}</h4>
              {calculation.breakdown.addOns.items.map((item, index) => (
                <div key={index} className="flex justify-between text-sm">
                  <span>{item.name}</span>
                  <span>{formatPrice(item.total)}</span>
                </div>
              ))}
            </section>
          )}

          {(() => {
            const houseCoeff = coefficients.find((c) => c.slug === "house");
            const isHouse = formData.building_type === "House";
            const showHouseMultiplier = isHouse && houseCoeff && houseCoeff.coefficient !== 1;
            const pct = (n: number) => `${n > 0 ? "+" : ""}${Math.round(n * 100)}%`;

            return showHouseMultiplier ? (
              <section className="space-y-1">
                <div className="flex justify-between text-sm">
                  <span>House</span>
                  <p>{pct(houseCoeff.coefficient - 1)}</p>
                </div>
              </section>
            ) : null;
          })()}

          {calculation.breakdown.frequency && (
            <section className="space-y-1">
              <h4 className="text-sm font-semibold">{ordersTranslation.summaryTranslation.frequency}</h4>
              <div className="flex justify-between text-sm">
                <span>{calculation.breakdown.frequency.name}</span>
                <div className="flex items-center gap-2">
                  {calculation.breakdown.frequency.discount > 0 && (
                    <span className="text-muted-foreground">-{calculation.breakdown.frequency.discount}%</span>
                  )}
                </div>
              </div>
            </section>
          )}

          {calculation.breakdown.location && (
            <section className="space-y-1">
              <h4 className="text-sm font-semibold">{ordersTranslation.summaryTranslation.location}</h4>
              <div className="flex justify-between text-sm">
                <span>
                  {
                    ordersTranslation.yourOrder.city[
                      calculation.breakdown.location.name as keyof typeof ordersTranslation.yourOrder.city
                    ]?.label
                  }
                </span>
                {calculation.breakdown.location.discount !== 0 && (
                  <span className="text-muted-foreground">
                    {calculation.breakdown.location.discount > 0 ? "+" : ""}
                    {calculation.breakdown.location.discount}%
                  </span>
                )}
              </div>
            </section>
          )}
        </div>

        <Separator className="my-3" />

        <section className="space-y-1">
          <div className="flex justify-between text-sm font-semibold">
            <span>{ordersTranslation.summaryTranslation.total}</span>
            <span>{formatPrice(calculation.total)}</span>
          </div>
          <div className="text-muted-foreground flex justify-between text-sm">
            <span>{ordersTranslation.summaryTranslation.vat}</span>
            <span>{formatPrice(calculation.vatAmount)}</span>
          </div>
        </section>

        <Separator className="my-3" />

        <section className="space-y-1">
          <h4 className="text-sm font-semibold">{ordersTranslation.summaryTranslation.address}</h4>
          <div className="space-y-2 text-sm">
            <Row label={ordersTranslation.summaryTranslation.streetAddress} value={formData.address.street || "-"} />
            <Row label={ordersTranslation.summaryTranslation.unitApartment} value={formData.address.unit || "-"} />
            <Row label={ordersTranslation.summaryTranslation.city} value={formData.address.city || "-"} />
            <Row label={ordersTranslation.summaryTranslation.province} value={formData.address.province || "-"} />
          </div>
        </section>

        <Separator className="my-3" />

        <section className="space-y-1">
          <h4 className="text-sm font-semibold">{ordersTranslation.summaryTranslation.customerInformation}</h4>
          <div className="space-y-2 text-sm">
            <Row
              label={ordersTranslation.summaryTranslation.customer}
              value={`${formData.contact.first_name || ""} ${formData.contact.last_name || ""}`.trim() || "-"}
            />
            <Row label={ordersTranslation.summaryTranslation.email} value={formData.contact.email || "-"} />
            <Row label={ordersTranslation.summaryTranslation.phone} value={formData.contact.phone || "-"} />
          </div>
        </section>

        <Separator className="my-3" />

        <section>
          <div className="flex items-center justify-between text-sm">
            <div className="flex items-center gap-2">
              <PaymentIcon className="iconSize" />
              <h4 className="text-sm font-semibold text-nowrap">
                {ordersTranslation.summaryTranslation.paymentMethod}
              </h4>
            </div>
            <span className="line-clamp-1 pl-5">{formData.payment_method}</span>
          </div>
        </section>

        <Separator className="my-3" />

        {!BUSINESS_SERVICE_ORDER.includes(formData.service_type as any) &&
          formData.service_type !== "office" &&
          formData.service_type !== "staircases" && (
            <section className="space-y-1">
              <div className="flex justify-between text-sm">
                <span>{ordersTranslation.summaryTranslation.estimatedTime}</span>
                <span>
                  {request.meta.client_estimated_hours} {request.meta.client_estimated_hours === 1 ? "hour" : "hours"}
                </span>
              </div>
            </section>
          )}
        <div className="bg-muted mt-3 rounded-lg px-3 py-2">
          <p className="text-muted-foreground text-sm">{ordersTranslation.summaryTranslation.supplies}</p>
        </div>

        {showButton && (
          <form onSubmit={formik.handleSubmit}>
            <Button
              type="submit"
              variant="blue"
              size="lg"
              className="mt-4 w-full"
              disabled={!formData.agreements.terms}
            >
              {`${ordersTranslation.summaryTranslation.placeOrderFor} ${formatPrice(calculation.total)}`}
            </Button>
          </form>
        )}
      </div>
    </div>
  );
}

function Row({ label, value }: { label: string; value: string }) {
  return (
    <div className="flex items-start justify-between gap-4">
      <span className="text-muted-foreground">{label}</span>
      <span className="text-right">{value}</span>
    </div>
  );
}
