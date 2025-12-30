import { useEffect, useState } from "react";

import type { CreateOrderFormValues } from "@/core/forms/orders/create";
import { cn } from "@/core/lib/utils";
import type { Addon } from "@/core/models/addons";
import type { Coefficient } from "@/core/models/coefficients";
import { Cadence, OrderFormData } from "@/core/models/orders";
import type { Service } from "@/core/models/services";
import { commonTranslation } from "@/core/translations/common";
import { ordersTranslation } from "@/core/translations/orders";
import { Badge } from "@/components/ui/badge";
import { Card, CardContent } from "@/components/ui/card";

import { calculateOrderClient } from "./utils/calculations";
import { transformOrderData } from "./utils/transformedData";

interface HowOftenProps {
  formData: CreateOrderFormValues;
  services: Service[];
  addons: Addon[];
  coefficients: Coefficient[];
  onFrequencyChange: (frequency: string) => void;
  showForAllServices?: boolean;
}

function convertToOrderFormData(formData: CreateOrderFormValues): OrderFormData {
  return {
    service_type: formData.service_type,
    rooms: formData.rooms,
    bathrooms: formData.bathrooms,
    kitchens: formData.kitchens,
    building_type: formData.building_type,
    selected_date: formData.selected_date,
    selected_time: formData.selected_time,
    reconfirm: formData.reconfirm,
    frequency: formData.frequency,
    frequency_discount: 0,
    selected_services: formData.selected_services,
    is_vacuum_selected: formData.is_vacuum_selected,
    address: {
      street: formData.address.street,
      unit: formData.address.unit,
      city: formData.address.city,
      province: formData.address.province,
      entry_instructions: formData.address.entry_instructions,
      landmarks: "",
    },
    contact: formData.contact,
    square_feet: formData.square_feet,
    windows: formData.windows,
    payment_method: formData.payment_method,
    agreements: formData.agreements,
    vat_info: {
      company_name: formData.vat_info.company_name,
      vat_number: formData.vat_info.vat_number,
      billing_address: formData.vat_info.billing_address,
      invoice_email: formData.vat_info.invoice_email,
      contact_person: formData.vat_info.contact_person,
      phone_number: formData.vat_info.phone_number,
    },
  };
}

export default function HowOften({
  formData,
  services,
  addons,
  coefficients,
  onFrequencyChange,
  showForAllServices = false,
}: HowOftenProps) {
  const [selectedFrequency, setSelectedFrequency] = useState<Cadence>(formData.frequency || "discount-once");

  useEffect(() => {
    if (selectedFrequency !== (formData.frequency || "discount-once")) {
      setSelectedFrequency(formData.frequency || "discount-once");
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [formData.frequency]);

  const handleFrequencySelect = (frequency: Cadence) => {
    setSelectedFrequency(frequency);
    onFrequencyChange(frequency);
  };

  const shouldShow = showForAllServices || ["standard", "deep", "office", "staircases"].includes(formData.service_type);

  if (!shouldShow) {
    return null;
  }

  const orderFormData = convertToOrderFormData(formData);

  return (
    <Card id="frequency" className="scroll-mt-32">
      <p className="border-b px-6 pb-6 text-xl font-semibold">{ordersTranslation.yourOrder.frequency.title}</p>
      <CardContent className="h-fit">
        <p className="text-muted-foreground mb-2 text-sm font-normal">
          {ordersTranslation.yourOrder.frequency.description}
        </p>
        <div className="grid h-full w-full grid-cols-1 gap-2 p-0 shadow-none md:grid-cols-4">
          {commonTranslation.howMuchItCost.tabs.map(({ slug, title }, index) => {
            const discountCoeff = coefficients?.find((c) => c.slug === slug);

            if (!discountCoeff) {
              return null;
            }

            const orderFormDataWithFrequency = { ...orderFormData, frequency: slug as Cadence };
            const requestDataWithFrequency = transformOrderData(
              orderFormDataWithFrequency,
              services,
              coefficients,
              addons
            );
            const calculationWithFrequency = calculateOrderClient(
              requestDataWithFrequency,
              services,
              addons,
              coefficients
            );

            const display = `${Math.round(calculationWithFrequency.total)} ${commonTranslation.cad}`;

            const percent = (1 - discountCoeff.coefficient) * 100;
            const label = `${percent.toFixed(0)}%`;

            return (
              <div
                key={index}
                tabIndex={0}
                onClick={() => handleFrequencySelect(slug as Cadence)}
                className={cn(
                  selectedFrequency === slug ? "text-background bg-blue" : "bg-[#F2F4F7]",
                  "hover:border-blue flex cursor-pointer flex-col items-center gap-5 rounded-md border p-4 text-sm font-medium transition-all md:items-start md:p-6"
                )}
              >
                <div className="*:h-7">
                  {discountCoeff.coefficient < 1 ? (
                    <Badge
                      variant="blue"
                      className={cn(
                        selectedFrequency === slug && "bg-[#09233A]",
                        "rounded-full px-2 py-1 text-xl font-semibold!"
                      )}
                    >
                      -{label}
                    </Badge>
                  ) : (
                    <div />
                  )}
                </div>

                <div className="space-y-1">
                  <p className="text-base">{title}</p>
                  <p className="text-xl font-bold">{display}</p>
                </div>
              </div>
            );
          })}
        </div>
      </CardContent>
    </Card>
  );
}
