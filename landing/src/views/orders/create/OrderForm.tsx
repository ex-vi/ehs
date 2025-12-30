"use client";

import { FormikProps } from "formik";
import { Mail } from "lucide-react";
import { useEffect, useMemo, useState } from "react";
import Image from "next/image";
import Link from "next/link";

import {
  ADDON_ORDER,
  BUSINESS_SERVICE_ORDER,
  INDIVIDUAL_SERVICE_ORDER,
  RENOVATION_SERVICES_ORDER,
  SERVICES_WITH_BASE_ROOMS,
} from "@/core/constants/common";
import { CreateOrderFormValues } from "@/core/forms/orders/create";
import { cn } from "@/core/lib/utils";
import type { Addon, AddonSlug } from "@/core/models/addons";
import type { Coefficient } from "@/core/models/coefficients";
import type { Service } from "@/core/models/services";
import type { Tax } from "@/core/models/tax";
import { commonTranslation } from "@/core/translations/common";
import { ordersTranslation } from "@/core/translations/orders";
import { termsTranslation } from "@/core/translations/terms";
import { CleaningCard } from "@/components/CleaningCard";
import { Counter } from "@/components/counter";
import { FormBlock } from "@/components/FormBlock";
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Checkbox } from "@/components/ui/checkbox";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectGroup, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Textarea } from "@/components/ui/textarea";

import CalendarInDetails from "./calendar";
import { CompactCounter } from "./CompactCounter";
import HowOften from "./HowOften";
import { renovationServiceDescriptionMap, renovationServiceIconMap, RenovationServices } from "./RenovationServices";
import { calculateOrderClient } from "./utils/calculations";
import { CLEANING_CARDS } from "./utils/constants";
import { transformOrderData } from "./utils/transformedData";

interface OrderFormProps {
  services: Service[];
  addons: Addon[];
  coefficients: Coefficient[];
  tax?: Tax | null;
  formik: FormikProps<CreateOrderFormValues>;
}

const placesTabs = [
  {
    label: ordersTranslation.yourOrder.buildings[0],
    iconHref: "/services/apartment.svg",
  },
  {
    label: ordersTranslation.yourOrder.buildings[1],
    iconHref: "/services/house.svg",
  },
] as const;

const paymentsTabs = [
  {
    label: ordersTranslation.yourOrder.paymentMethod.cash.label,
    iconHref: ordersTranslation.yourOrder.paymentMethod.cash.imageHref,
  },
  {
    label: ordersTranslation.yourOrder.paymentMethod.card.label,
    iconHref: ordersTranslation.yourOrder.paymentMethod.card.imageHref,
  },
  {
    label: ordersTranslation.yourOrder.paymentMethod.eTransfer.label,
    iconHref: ordersTranslation.yourOrder.paymentMethod.eTransfer.imageHref,
  },
  {
    label: ordersTranslation.yourOrder.paymentMethod.invoice.label,
    iconHref: ordersTranslation.yourOrder.paymentMethod.invoice.imageHref,
  },
] as const;

const getServiceIcon = (slug: string): string => {
  const iconMap: Record<string, string> = {
    standard: "/services/standard.svg",
    deep: "/services/deep.svg",
    "move-in": "/services/packing.svg",
    // "after-renovation": "/services/renovation.svg",
    renovations: "/services/renovation.svg",
    office: "/services/offices.svg",
    kitchen: "/services/kitchen-cabinets.svg",
    windows: "/services/window.svg",
    staircases: "/services/stairwells.svg",
  };

  return iconMap[slug];
};

const getAddonIcon = (slug: AddonSlug): string => {
  const iconMap: Record<AddonSlug, string> = {
    "vacuum-cleaner": "/services/vacuum-hand.svg",
    balcony: "/services/balcony.svg",
    closet: "/services/closet.svg",
    "dishwasher-machine": "/services/dishwasher.svg",
    dishwashing: "/services/dishes.svg",
    "extra-hours": "/services/hours.svg",
    fridge: "/services/fridge.svg",
    ironing: "/services/ironing.svg",
    "litter-box": "/services/tray.svg",
    microwave: "/services/microwave.svg",
    oven: "/services/oven.svg",
    "range-hood": "/services/hood.svg",
    window: "/services/window.svg",
    laundry: "/services/laundry.svg",
    gardines: "/services/gardines.svg",
    "pet-cleaning": "/services/pet-cleaning.svg",
  };

  return iconMap[slug];
};

export default function OrderForm({ services, addons, coefficients, tax, formik }: OrderFormProps) {
  const { values, errors, touched, handleChange, handleBlur, setFieldValue } = formik;

  const getFieldError = (fieldPath: string) => {
    const pathParts = fieldPath.split(".");
    let error: any = errors;
    let touch: any = touched;

    for (const part of pathParts) {
      error = error?.[part];
      touch = touch?.[part];
    }

    return touch && error ? error : "";
  };

  const [prevServiceType, setPrevServiceType] = useState(values.service_type);

  const sortedServices = useMemo(() => {
    const individualServices = INDIVIDUAL_SERVICE_ORDER.map((slug) =>
      services.find((service) => service.slug === slug)
    ).filter(Boolean) as Service[];

    const businessServices = BUSINESS_SERVICE_ORDER.map((slug) =>
      services.find((service) => service.slug === slug)
    ).filter(Boolean) as Service[];

    const usedSlugs = [...INDIVIDUAL_SERVICE_ORDER, ...BUSINESS_SERVICE_ORDER];
    const remainingServices = services.filter((service) => !usedSlugs.includes(service.slug as any));

    return [...individualServices, ...businessServices, ...remainingServices];
  }, [services]);

  const serviceGroups = useMemo(() => {
    const individualServices = INDIVIDUAL_SERVICE_ORDER.map((slug) =>
      services.find((service) => service.slug === slug)
    ).filter(Boolean) as Service[];

    const businessServices = BUSINESS_SERVICE_ORDER.map((slug) =>
      services.find((service) => service.slug === slug)
    ).filter(Boolean) as Service[];

    return {
      individual: individualServices,
      business: businessServices,
    };
  }, [services]);

  const resetFormFields = () => {
    setFieldValue("frequency", "discount-once");
    setFieldValue("selected_services", {});
    setFieldValue("is_vacuum_selected", false);
    setFieldValue("building_type", "Apartment");
    setFieldValue("square_feet", "");

    // TEMPORARY: Reset renovation services for all services except renovations
    if (values.service_type !== "renovations") {
      setFieldValue("renovation_services", {});
    }

    if (SERVICES_WITH_BASE_ROOMS.includes(values.service_type as any)) {
      setFieldValue("rooms", 1);
      setFieldValue("bathrooms", 1);
      setFieldValue("kitchens", 1);
      setFieldValue("windows", 0);
      setFieldValue("square_feet", "");
    } else if (values.service_type === "windows") {
      setFieldValue("rooms", 0);
      setFieldValue("bathrooms", 0);
      setFieldValue("kitchens", 0);
      setFieldValue("windows", 5);
      setFieldValue("square_feet", "");
    } else if (values.service_type === "kitchen") {
      setFieldValue("rooms", 0);
      setFieldValue("bathrooms", 0);
      setFieldValue("kitchens", 1);
      setFieldValue("windows", 0);
      setFieldValue("square_feet", "");
    } else if (values.service_type === "office") {
      setFieldValue("rooms", 0);
      setFieldValue("bathrooms", 0);
      setFieldValue("kitchens", 0);
      setFieldValue("windows", 0);
      setFieldValue("square_feet", "1");
    } else if (values.service_type === "staircases") {
      setFieldValue("rooms", 0);
      setFieldValue("bathrooms", 0);
      setFieldValue("kitchens", 0);
      setFieldValue("windows", 0);
      setFieldValue("square_feet", "1");
    } else if (values.service_type === "renovations") {
      setFieldValue("rooms", 0);
      setFieldValue("bathrooms", 0);
      setFieldValue("kitchens", 0);
      setFieldValue("windows", 0);
      setFieldValue("square_feet", "0");
    } else {
      setFieldValue("rooms", 0);
      setFieldValue("bathrooms", 0);
      setFieldValue("kitchens", 0);
      setFieldValue("windows", 0);
      setFieldValue("square_feet", "");
    }
  };

  useEffect(() => {
    if (values.service_type !== prevServiceType) {
      resetFormFields();
      setPrevServiceType(values.service_type);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [values.service_type]);

  const exBusinessType = ["office", "staircases"];

  const isExBusiness = exBusinessType.includes(values.service_type);

  const currentServiceType = useMemo(() => {
    const currentService = sortedServices.find((s) => s.slug === values.service_type);
    if (!currentService) return "individual";

    if (BUSINESS_SERVICE_ORDER.includes(currentService.slug as any)) {
      return "business";
    }
    return "individual";
  }, [values.service_type, sortedServices]);

  useEffect(() => {
    const handleCalendarChange = (event: CustomEvent) => {
      const { selectedDate: newDate, selectedTime: newTime } = event.detail;
      setFieldValue("selected_date", newDate);
      setFieldValue("selected_time", newTime);
    };

    window.addEventListener("calendarChange", handleCalendarChange as EventListener);

    return () => {
      window.removeEventListener("calendarChange", handleCalendarChange as EventListener);
    };
  }, [setFieldValue]);

  const orderFormData = useMemo(
    () => ({
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
        ...values.address,
        landmarks: "",
      },
      contact: values.contact,
      square_feet: values.square_feet,
      windows: values.windows,
      payment_method: values.payment_method,
      vat_info: values.vat_info,
      agreements: values.agreements,
      // TEMPORARY: Renovation services support - can be easily removed
      renovation_services: values.renovation_services,
    }),
    [values]
  );

  useEffect(() => {
    const event = new CustomEvent("orderFormChange", { detail: orderFormData });
    window.dispatchEvent(event);
  }, [orderFormData]);

  const requestData = transformOrderData(orderFormData, services, coefficients, addons, tax);
  const baseCalculation = calculateOrderClient(requestData, services, addons, coefficients, tax);

  return (
    <form onSubmit={formik.handleSubmit} className="space-y-6">
      <p id="details" className="heading-md scroll-mt-32">
        {ordersTranslation.yourOrder.details}
      </p>

      <div className="grid grid-cols-1 gap-4">
        <Tabs
          value={values.service_type}
          onValueChange={(value) => setFieldValue("service_type", value)}
          className="w-full"
        >
          <p className="text-lg font-semibold">{ordersTranslation.cleaning}</p>

          <TabsList
            style={
              {
                // gridTemplateColumns: "repeat(auto-fit, minmax(80px, 1fr))",
              }
            }
            className={cn(
              "h-full gap-1 scroll-smooth p-0.5 shadow-none",
              "max-sm:grid max-sm:w-full",
              "sm:flex sm:w-full",
              "sm:*:min-w-0 sm:*:flex-1",
              "grid-cols-3 md:grid-cols-none"
            )}
          >
            {serviceGroups.individual.map((service) => (
              <TabsTrigger
                key={service.slug}
                value={service.slug}
                className={cn(
                  "data-[state=active]:bg-blue data-[state=active]:text-primary-foreground",
                  "flex flex-col items-center justify-center p-2 text-xs font-medium transition-all"
                )}
              >
                <Image src={getServiceIcon(service.slug)} alt={service.name} width={32} height={32} />
                <p className="mt-1 text-center text-sm leading-tight">{service.name}</p>
              </TabsTrigger>
            ))}
          </TabsList>
        </Tabs>

        <Tabs value={values.service_type} onValueChange={(value) => setFieldValue("service_type", value)}>
          <p className="text-lg font-semibold">{ordersTranslation.renovations}</p>

          <TabsList
            style={{
              gridTemplateColumns: "repeat(auto-fit, minmax(80px, 1fr))",
            }}
            className={cn(
              "gap-1 scroll-smooth p-0.5 shadow-none",
              "max-sm:grid max-sm:w-full",
              "sm:flex sm:w-full sm:overflow-x-auto",
              "sm:*:min-w-0 sm:*:flex-1"
            )}
          >
            {serviceGroups.business.map((service) => (
              <TabsTrigger
                key={service.slug}
                value={service.slug}
                className={cn(
                  "data-[state=active]:bg-blue data-[state=active]:text-primary-foreground",
                  "flex min-w-20 flex-col items-center justify-center p-2 text-xs font-medium transition-all"
                )}
              >
                <Image src={getServiceIcon(service.slug)} alt={service.name} width={32} height={32} />
                <p className="mt-1 text-center text-sm leading-tight">{service.name}</p>
              </TabsTrigger>
            ))}
          </TabsList>
        </Tabs>
      </div>
      {values.service_type !== "renovations" && (
        <Accordion type="single" collapsible className="rounded-lg border p-0">
          <AccordionItem value="cleaning-details">
            <AccordionTrigger
              className="items-center p-6 text-left text-base font-medium"
              aria-controls="cleaning-details-content"
            >
              <div className="flex h-full items-center gap-2">
                <Image src="/question.svg" width={32} height={32} alt="question icon" />
                <p className="text-xl font-semibold">{ordersTranslation.whatCleaningConsistsOf}</p>
              </div>
            </AccordionTrigger>
            <AccordionContent id="cleaning-details-content" className="text-muted-foreground p-6 text-sm">
              {(() =>
                values.service_type in CLEANING_CARDS ? (
                  <CleaningCard
                    variant={values.service_type as keyof typeof CLEANING_CARDS}
                    defaultOpen={true}
                    className="rounded-none border-0 shadow-none"
                  />
                ) : (
                  <div className="text-muted-foreground p-6 text-center">
                    <p>Service information will be available soon.</p>
                  </div>
                ))()}
            </AccordionContent>
          </AccordionItem>
        </Accordion>
      )}

      {values.service_type === "renovations" && (
        <Accordion type="single" collapsible className="rounded-lg border p-0">
          <AccordionItem value="renovation-descriptions">
            <AccordionTrigger
              className="items-center p-6 text-left text-base font-medium"
              aria-controls="cleaning-details-content"
            >
              <div className="flex h-full items-center gap-2">
                <Image src="/question.svg" width={32} height={32} alt="question icon" />
                <p className="text-xl font-semibold">{ordersTranslation.whatRenovationConsistsOf}</p>
              </div>
            </AccordionTrigger>
            <AccordionContent className="text-muted-foreground p-6 text-sm">
              <Tabs defaultValue={RENOVATION_SERVICES_ORDER[0]} className="w-full">
                <TabsList
                  className={cn(
                    "h-full gap-1 scroll-smooth p-0.5 shadow-none",
                    "max-sm:grid max-sm:w-full",
                    "sm:flex sm:w-full",
                    "sm:*:min-w-0 sm:*:flex-1",
                    "grid-cols-3 md:grid-cols-none"
                  )}
                >
                  {RENOVATION_SERVICES_ORDER.map((slug) => {
                    const service = services.find((s) => s.slug === slug);
                    return service ? (
                      <TabsTrigger
                        key={slug}
                        value={slug}
                        className={cn(
                          "data-[state=active]:bg-blue data-[state=active]:text-primary-foreground",
                          "flex flex-col items-center justify-center p-2 text-xs font-medium transition-all"
                        )}
                      >
                        <Image src={renovationServiceIconMap[slug]} alt={service.name} width={34} height={34} />
                        {service.name.split(" ")[0]}
                      </TabsTrigger>
                    ) : null;
                  })}
                </TabsList>

                {RENOVATION_SERVICES_ORDER.map((slug) => {
                  const service = services.find((s) => s.slug === slug);
                  const description = renovationServiceDescriptionMap[slug];

                  return service && description ? (
                    <TabsContent key={slug} value={slug} className="mt-4">
                      <div className="space-y-6">
                        <div>
                          <h3 className="text-foreground mb-3 text-lg font-semibold md:text-xl">{service.name}</h3>

                          <div className="space-y-4">
                            <div>
                              <h4 className="text-foreground mb-3 text-lg font-semibold">
                                {description.consistsOf.title}
                              </h4>
                              {description.consistsOf.sections.map((section, index) => (
                                <div key={index} className="space-y-4">
                                  {section.title && (
                                    <h5 className="text-foreground mb-2 text-sm font-medium">{section.title}</h5>
                                  )}
                                  {section.description && (
                                    <p className="text-foreground mb-2 text-sm">{section.description}</p>
                                  )}
                                  {section.items && (
                                    <ul className="text-foreground list-inside list-disc">
                                      {section.items.map((item, itemIndex) => (
                                        <li key={itemIndex}>{item}</li>
                                      ))}
                                    </ul>
                                  )}
                                </div>
                              ))}
                            </div>

                            <div>
                              <h4 className="text-foreground mb-3 text-base font-medium">
                                {description.mayIncreasePrice.title}
                              </h4>
                              {description.mayIncreasePrice.sections.map((section, index) => (
                                <div key={index} className="space-y-4">
                                  {section.title && (
                                    <h5 className="text-foreground mb-2 text-sm font-medium">{section.title}</h5>
                                  )}
                                  <ul className="text-foreground list-inside list-disc">
                                    {section.items.map((item, itemIndex) => (
                                      <li key={itemIndex}>{item}</li>
                                    ))}
                                  </ul>
                                </div>
                              ))}
                            </div>
                          </div>
                        </div>
                      </div>
                    </TabsContent>
                  ) : null;
                })}
              </Tabs>
            </AccordionContent>
          </AccordionItem>
        </Accordion>
      )}
      {values.service_type === "renovations" && (
        <Card>
          <CardContent>
            <h1 className="mb-6 text-xl font-semibold">Select renovation services</h1>
            <RenovationServices
              services={services.filter((service) => RENOVATION_SERVICES_ORDER.includes(service.slug))}
              onChange={(renovationData) => {
                // TEMPORARY: Update form data with renovation services
                setFieldValue("renovation_services", renovationData);
              }}
            />
          </CardContent>
        </Card>
      )}

      {values.service_type !== "renovations" && (
        <Card id="place" className="scroll-mt-32">
          <p className="border-b px-6 pb-6 text-xl font-semibold">
            {values.service_type === "office" ? ordersTranslation.yourOrder.office : ordersTranslation.yourOrder.place}
          </p>
          <CardContent>
            {values.service_type === "office" ? (
              <div className="grid w-full items-end gap-4 md:grid-cols-3">
                <FormBlock
                  label={ordersTranslation.yourOrder.squareFeet}
                  field={
                    <Input
                      name="square_feet"
                      type="text"
                      value={values.square_feet}
                      onChange={(e) => {
                        const value = e.target.value;
                        if (/^\d*$/.test(value)) {
                          setFieldValue("square_feet", value);
                        }
                      }}
                      onBlur={handleBlur}
                      className={cn(getFieldError("square_feet") && "border-destructive")}
                    />
                  }
                />

                <Counter
                  label={ordersTranslation.bathroom}
                  value={values.bathrooms}
                  onChange={(value) => setFieldValue("bathrooms", value)}
                  min={0}
                  max={10}
                  className="h-fit w-full shadow-none"
                  size="sm"
                />

                <Counter
                  label={ordersTranslation.kitchen}
                  value={values.kitchens}
                  onChange={(value) => setFieldValue("kitchens", value)}
                  min={0}
                  max={10}
                  className="h-fit w-full shadow-none"
                  size="sm"
                />
              </div>
            ) : values.service_type === "windows" ? (
              <div className="mb-6 grid grid-cols-1 gap-2 border-b pb-6 md:grid-cols-3 md:gap-4">
                <Counter
                  label="Windows"
                  value={values.windows}
                  onChange={(value) => setFieldValue("windows", value)}
                  min={5}
                  max={50}
                  className="h-fit w-full shadow-none"
                  size="sm"
                />
              </div>
            ) : values.service_type === "staircases" ? (
              <div className="grid w-full grid-cols-1 gap-4 md:grid-cols-3">
                <FormBlock
                  label={ordersTranslation.yourOrder.squareFeet}
                  field={
                    <Input
                      name="square_feet"
                      type="text"
                      value={values.square_feet}
                      onChange={(e) => {
                        const value = e.target.value;
                        if (/^\d*$/.test(value)) {
                          setFieldValue("square_feet", value);
                        }
                      }}
                      onBlur={handleBlur}
                      className={cn(getFieldError("square_feet") && "border-destructive")}
                    />
                  }
                />
              </div>
            ) : values.service_type !== "staircases" && values.service_type !== "windows" ? (
              <div
                className={cn(
                  currentServiceType !== "business" && !isExBusiness && "mb-6 border-b pb-6",
                  "grid grid-cols-1 gap-2 md:grid-cols-3 md:gap-4"
                )}
              >
                <Counter
                  label={ordersTranslation.room}
                  value={values.rooms}
                  onChange={(value) => setFieldValue("rooms", value)}
                  min={0}
                  max={10}
                  className="h-fit w-full shadow-none"
                  size="sm"
                />
                <Counter
                  label={ordersTranslation.bathroom}
                  value={values.bathrooms}
                  onChange={(value) => setFieldValue("bathrooms", value)}
                  min={0}
                  max={10}
                  className="h-fit w-full shadow-none"
                  size="sm"
                />
                <Counter
                  label={ordersTranslation.kitchen}
                  value={values.kitchens}
                  onChange={(value) => setFieldValue("kitchens", value)}
                  min={0}
                  max={10}
                  className="h-fit w-full shadow-none"
                  size="sm"
                />
              </div>
            ) : null}

            {currentServiceType !== "business" && !isExBusiness && (
              <Tabs
                value={values.building_type}
                onValueChange={(value) => setFieldValue("building_type", value)}
                className="w-full"
              >
                <TabsList className="flex h-fit max-h-[82px] w-full p-0.5 shadow-none">
                  {placesTabs.map(({ label, iconHref }, index) => {
                    const buildingCoeff = coefficients.find((c) => c.slug === "house");
                    const showCoefficient = label === "House" && buildingCoeff && buildingCoeff.coefficient !== 1;

                    return (
                      <TabsTrigger
                        key={index}
                        value={label}
                        className="data-[state=active]:text-primary-foreground data-[state=active]:bg-blue flex max-h-[78px] min-h-fit flex-col p-2 text-sm font-medium transition-all md:h-fit"
                      >
                        <Image src={iconHref} alt={label} width={34} height={34} />
                        <p>
                          {label}
                          {showCoefficient && (
                            <span className="ml-1 text-xs opacity-75">(x{buildingCoeff.coefficient})</span>
                          )}
                        </p>
                      </TabsTrigger>
                    );
                  })}
                </TabsList>
              </Tabs>
            )}
          </CardContent>
        </Card>
      )}

      <Card id="datetime" className="scroll-mt-32">
        <p className="border-b px-6 pb-6 text-xl font-semibold">{ordersTranslation.yourOrder.dateAndTime}</p>
        <CardContent>
          <CalendarInDetails hideTimeSlots={values.service_type === "renovations"} />
          {getFieldError("selectedDate") && (
            <p className="mt-2 text-sm text-red-600">{getFieldError("selectedDate")}</p>
          )}
          <div className="flex items-center gap-2 px-2 py-4">
            <Checkbox
              id="reconfirm"
              name="reconfirm"
              checked={values.reconfirm}
              onCheckedChange={(checked) => setFieldValue("reconfirm", !!checked)}
            />
            <Label htmlFor="reconfirm">{ordersTranslation.yourOrder.reconfirm}</Label>
          </div>
        </CardContent>
      </Card>

      {values.service_type !== "renovations" && (
        <HowOften
          formData={values}
          services={services}
          addons={addons}
          coefficients={coefficients}
          onFrequencyChange={(frequency) => setFieldValue("frequency", frequency)}
          showForAllServices={true}
        />
      )}

      {values.service_type !== "renovations" && (
        <Card id="options" className="scroll-mt-32">
          <p className="border-b px-6 pb-6 text-xl font-semibold">{ordersTranslation.yourOrder.options.title}</p>
          <CardContent className="h-fit">
            <div className="grid grid-cols-2 gap-3 md:grid-cols-4 md:gap-4">
              {ADDON_ORDER.map((slug) => addons.find((addon) => addon.slug === slug))
                .filter((addon) => addon && addon.slug !== "vacuum-cleaner")
                .map((addon, index) => {
                  if (!addon) return null;

                  const isSelected = (values.selected_services[addon.slug] || 0) > 0;
                  const count = values.selected_services[addon.slug] || 0;

                  const toggleAddon = () => {
                    const currentServices = values.selected_services;
                    setFieldValue("selected_services", {
                      ...currentServices,
                      [addon.slug]: currentServices[addon.slug] > 0 ? 0 : 1,
                    });
                  };

                  const updateAddonQuantity = (quantity: number) => {
                    setFieldValue("selected_services", {
                      ...values.selected_services,
                      [addon.slug]: quantity,
                    });
                  };

                  return (
                    <div
                      key={index}
                      onClick={toggleAddon}
                      className={cn(
                        "cursor-pointer rounded-lg border transition-all hover:border-blue-400",
                        "h-[140px] w-full md:h-[184px]",
                        "p-2 md:p-4",
                        isSelected ? "bg-blue text-white" : "bg-background"
                      )}
                    >
                      <div className="flex h-full flex-col justify-between space-y-3">
                        <div className="relative flex h-full items-center justify-center">
                          {isSelected ? (
                            <div onClick={(e) => e.stopPropagation()} className="flex w-full justify-center md:h-10">
                              <CompactCounter
                                value={count}
                                onChange={(value) => updateAddonQuantity(value)}
                                min={1}
                                max={10}
                                className=""
                              />
                            </div>
                          ) : (
                            <div className="">
                              <Image
                                src={getAddonIcon(addon.slug)}
                                alt={addon.name}
                                width={36}
                                height={36}
                                className="md:h-[58px] md:w-[58px]"
                              />
                            </div>
                          )}
                        </div>

                        <div className="flex flex-col items-center justify-center gap-1">
                          <p
                            className={cn(
                              "line-clamp-2 text-center text-xs font-medium md:h-10 md:text-sm",
                              isSelected ? "text-white" : "text-foreground"
                            )}
                          >
                            {addon.name}
                          </p>
                          <Button
                            type="button"
                            variant={"secondary"}
                            className={cn("text-blue w-fit")}
                            onClick={toggleAddon}
                          >
                            {addon.price} {commonTranslation.cad}
                          </Button>
                        </div>
                      </div>
                    </div>
                  );
                })}
            </div>

            {(() => {
              const vacuumAddon = addons.find((addon) => addon.slug === "vacuum-cleaner");

              return vacuumAddon ? (
                <div className="mt-6 border-t pt-6">
                  <label
                    htmlFor="vacuum-cleaner"
                    className={cn("flex w-full cursor-pointer justify-center rounded-lg border transition-all")}
                  >
                    <div className="hidden items-center gap-4 p-4 md:flex">
                      <Checkbox
                        id="vacuum-cleaner"
                        checked={values.is_vacuum_selected}
                        onCheckedChange={(checked) => setFieldValue("is_vacuum_selected", !!checked)}
                        onClick={(e) => e.stopPropagation()}
                      />
                      <Image src={getAddonIcon(vacuumAddon.slug)} alt={vacuumAddon.name} width={50} height={50} />
                      <p className={cn("text-foreground flex-1 font-medium")}>{vacuumAddon.name}</p>
                      <div
                        className={cn(
                          values.is_vacuum_selected && "text-blue",
                          "focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive bg-blue dark:focus-visible:ring-blue/40 dark:bg-destructive/60 inline-flex h-9 w-fit shrink-0 items-center justify-center gap-2 rounded-md px-4 py-2 text-sm font-medium whitespace-nowrap text-white shadow-xs transition-all outline-none hover:bg-[#006CCC] focus-visible:ring-[3px] disabled:pointer-events-none disabled:opacity-50 has-[>svg]:px-3 [&_svg]:pointer-events-none [&_svg]:shrink-0 [&_svg:not([class*='size-'])]:size-4"
                        )}
                      >
                        {vacuumAddon.price} {commonTranslation.cad}
                      </div>
                    </div>

                    <div
                      className={cn(
                        "flex w-full flex-col items-center gap-3 rounded-lg p-4 md:hidden",
                        values.is_vacuum_selected ? "bg-blue text-white" : "bg-background"
                      )}
                      onClick={() => setFieldValue("is_vacuum_selected", !!values.is_vacuum_selected)}
                    >
                      <Image src={getAddonIcon(vacuumAddon.slug)} alt={vacuumAddon.name} width={40} height={40} />
                      <p
                        className={cn(
                          "text-center text-sm font-medium",
                          values.is_vacuum_selected ? "text-white" : "text-foreground"
                        )}
                      >
                        {vacuumAddon.name}
                      </p>

                      <div
                        className={cn(
                          "focus-visible:border-ring focus-visible:ring-ring/50 aria-invalid:ring-destructive/20 dark:aria-invalid:ring-destructive/40 aria-invalid:border-destructive inline-flex h-9 shrink-0 items-center justify-center gap-2 rounded-md px-4 py-2 text-sm font-medium whitespace-nowrap transition-all outline-none focus-visible:ring-[3px] disabled:pointer-events-none disabled:opacity-50 [&_svg]:pointer-events-none [&_svg]:shrink-0 [&_svg:not([class*='size-'])]:size-4",
                          values.is_vacuum_selected
                            ? "bg-secondary text-secondary-foreground hover:bg-secondary/80 shadow-xs"
                            : "bg-blue focus-visible:ring-blue/20 dark:focus-visible:ring-blue/40 dark:bg-destructive/60 text-white shadow-xs hover:bg-[#006CCC]"
                        )}
                      >
                        {vacuumAddon.price} {commonTranslation.cad}
                      </div>
                    </div>
                  </label>
                </div>
              ) : null;
            })()}
          </CardContent>
        </Card>
      )}

      <Card id="address" className="scroll-mt-32">
        <p className="border-b px-6 pb-6 text-xl font-semibold">
          {ordersTranslation.yourOrder.addressAndContacts.address}
        </p>
        <CardContent className="space-y-4">
          <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
            <FormBlock
              label={ordersTranslation.yourOrder.addressAndContacts.fields[0].label}
              field={
                <Input
                  name="address.street"
                  value={values.address.street}
                  onChange={handleChange}
                  onBlur={handleBlur}
                  placeholder={ordersTranslation.yourOrder.addressAndContacts.fields[0].label}
                  className={cn(getFieldError("address.street") && "border-destructive")}
                />
              }
            />
            <div className="grid grid-cols-3 items-stretch gap-2">
              <FormBlock
                className="col-span-2"
                label={ordersTranslation.yourOrder.addressAndContacts.fields[1].label}
                field={
                  <Input
                    name="address.unit"
                    value={values.address.unit}
                    onChange={handleChange}
                    onBlur={handleBlur}
                    placeholder={ordersTranslation.yourOrder.addressAndContacts.fields[1].label}
                  />
                }
              />
              <FormBlock
                className="h-full items-end"
                label={ordersTranslation.yourOrder.addressAndContacts.fields[4].label}
                field={
                  <Input
                    name="address.zip_code"
                    value={values.address.zip_code}
                    onChange={handleChange}
                    onBlur={handleBlur}
                    placeholder={ordersTranslation.yourOrder.addressAndContacts.fields[4].label}
                  />
                }
              />
            </div>
            <FormBlock
              label={ordersTranslation.yourOrder.addressAndContacts.fields[2].label}
              field={
                <Select value={values.address.city} onValueChange={(v) => formik.setFieldValue("address.city", v)}>
                  <SelectTrigger className={cn("w-full", getFieldError("address.city") && "border-destructive")}>
                    <SelectValue
                      className={cn(
                        formik.values.address.city === "" || (!formik.values.address.city && "text-muted-foreground")
                      )}
                      placeholder={ordersTranslation.yourOrder.addressAndContacts.fields[2].label}
                    />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectGroup>
                      <SelectItem value={ordersTranslation.yourOrder.city.halifax.values}>
                        {ordersTranslation.yourOrder.city.halifax.label}
                      </SelectItem>
                      <SelectItem value={ordersTranslation.yourOrder.city.suburbs.values}>
                        {ordersTranslation.yourOrder.city.suburbs.label}
                      </SelectItem>
                    </SelectGroup>
                  </SelectContent>
                </Select>
              }
            />
            <FormBlock
              label={ordersTranslation.yourOrder.addressAndContacts.fields[3].label}
              field={
                <Input
                  name="address.province"
                  value={values.address.province}
                  onChange={handleChange}
                  onBlur={handleBlur}
                  placeholder={ordersTranslation.yourOrder.addressAndContacts.fields[3].label}
                  className={cn(getFieldError("address.province") && "border-destructive")}
                />
              }
            />
          </div>

          <FormBlock
            label={ordersTranslation.yourOrder.addressAndContacts.fields[5].label}
            field={
              <Textarea
                name="address.entry_instructions"
                value={values.address.entry_instructions}
                onChange={handleChange}
                onBlur={handleBlur}
                placeholder={ordersTranslation.yourOrder.addressAndContacts.fields[5].placeholder}
                rows={3}
              />
            }
          />

          <div className="text-foreground text-sm">
            {ordersTranslation.yourOrder.addressAndContacts.fields[6].label}
          </div>
        </CardContent>
      </Card>

      <Card id="contact" className="scroll-mt-32">
        <p className="border-b px-6 pb-6 text-xl font-semibold">{ordersTranslation.yourOrder.contactDetails.title}</p>
        <CardContent className="space-y-4">
          <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
            <FormBlock
              label={ordersTranslation.yourOrder.contactDetails.firstName}
              field={
                <Input
                  name="contact.first_name"
                  value={values.contact.first_name}
                  onChange={handleChange}
                  onBlur={handleBlur}
                  placeholder={ordersTranslation.yourOrder.contactDetails.firstName}
                  className={cn(getFieldError("contact.first_name") && "border-destructive")}
                />
              }
            />
            <FormBlock
              label={ordersTranslation.yourOrder.contactDetails.lastName}
              field={
                <Input
                  name="contact.last_name"
                  value={values.contact.last_name}
                  onChange={handleChange}
                  onBlur={handleBlur}
                  placeholder={ordersTranslation.yourOrder.contactDetails.lastName}
                  className={cn(getFieldError("contact.last_name") && "border-destructive")}
                />
              }
            />
            <FormBlock
              label={ordersTranslation.yourOrder.contactDetails.email}
              field={
                <div className="relative">
                  <Mail className="text-foreground absolute top-2.5 left-3 h-4 w-4" />
                  <Input
                    type="email"
                    name="contact.email"
                    value={values.contact.email}
                    onChange={handleChange}
                    onBlur={handleBlur}
                    placeholder={ordersTranslation.yourOrder.contactDetails.email}
                    className={cn("pl-10", getFieldError("contact.email") && "border-destructive")}
                  />
                </div>
              }
            />
            <FormBlock
              label={ordersTranslation.yourOrder.contactDetails.phone}
              field={
                <Input
                  type="tel"
                  name="contact.phone"
                  value={values.contact.phone}
                  onChange={handleChange}
                  onBlur={handleBlur}
                  placeholder={ordersTranslation.yourOrder.contactDetails.phone}
                  className={cn(getFieldError("contact.phone") && "border-destructive")}
                />
              }
            />
          </div>

          <FormBlock
            label={ordersTranslation.yourOrder.contactDetails.otherInstructions}
            field={
              <Textarea
                name="contact.other_instructions"
                value={values.contact.other_instructions}
                onChange={handleChange}
                onBlur={handleBlur}
                placeholder={ordersTranslation.yourOrder.contactDetails.otherInstructions}
                rows={3}
              />
            }
          />
        </CardContent>
      </Card>

      <div id="payment" className="scroll-mt-32 space-y-6">
        <h3 className="text-xl font-semibold">{ordersTranslation.yourOrder.paymentMethod.title}</h3>

        <Tabs
          value={values.payment_method}
          onValueChange={(value) => setFieldValue("payment_method", value)}
          className="w-full"
        >
          <TabsList className="grid h-full w-full grid-cols-1 p-0.5 shadow-none md:grid-cols-4">
            {paymentsTabs.map(({ label, iconHref }, index) => (
              <TabsTrigger
                key={index}
                value={label}
                className={cn(
                  "data-[state=active]:text-primary-foreground data-[state=active]:bg-blue flex flex-col p-6 text-sm font-medium transition-all md:h-full"
                )}
              >
                <Image src={iconHref} alt={label} width={48} height={48} className="md:h-16 md:w-16" />
                <p className="text-center font-medium text-wrap">{label}</p>
              </TabsTrigger>
            ))}
          </TabsList>
        </Tabs>

        {values.payment_method === ordersTranslation.yourOrder.paymentMethod.invoice.label && (
          <Card className="border">
            <CardContent className="space-y-6 p-6">
              <h4 className="text-lg font-semibold">Data for HST Invoice</h4>

              <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
                <FormBlock
                  label="Company name"
                  field={
                    <Input
                      name="vat_info.company_name"
                      value={values.vat_info.company_name}
                      onChange={handleChange}
                      onBlur={handleBlur}
                      placeholder="MapleTech Solutions Inc."
                      className={cn(getFieldError("vat_info.company_name") && "border-destructive")}
                    />
                  }
                />

                <FormBlock
                  label="Business number"
                  field={
                    <Input
                      name="vat_info.vat_number"
                      value={values.vat_info.vat_number}
                      onChange={handleChange}
                      onBlur={handleBlur}
                      placeholder="78654 4321 RC0001"
                      className={cn(getFieldError("vat_info.vat_number") && "border-destructive")}
                    />
                  }
                />

                <FormBlock
                  label="Billing address"
                  field={
                    <Input
                      name="vat_info.billing_address"
                      value={values.vat_info.billing_address}
                      onChange={handleChange}
                      onBlur={handleBlur}
                      placeholder="2100 Barrington St, Suite 405, Halifax, NS B3J 2K4"
                      className={cn(getFieldError("vat_info.billing_address") && "border-destructive")}
                    />
                  }
                />

                <FormBlock
                  label="Email for invoice"
                  field={
                    <Input
                      name="vat_info.invoice_email"
                      type="email"
                      value={values.vat_info.invoice_email}
                      onChange={handleChange}
                      onBlur={handleBlur}
                      placeholder="accounting@mapletech.ca"
                      className={cn(getFieldError("vat_info.invoice_email") && "border-destructive")}
                    />
                  }
                />

                <FormBlock
                  label="Contact person"
                  field={
                    <Input
                      name="vat_info.contact_person"
                      value={values.vat_info.contact_person}
                      onChange={handleChange}
                      onBlur={handleBlur}
                      placeholder="Sarah McLeod"
                      className={cn(getFieldError("vat_info.contact_person") && "border-destructive")}
                    />
                  }
                />

                <FormBlock
                  label="Phone number"
                  field={
                    <Input
                      name="vat_info.phone_number"
                      value={values.vat_info.phone_number}
                      onChange={handleChange}
                      onBlur={handleBlur}
                      placeholder="+1 461 12 34 56"
                      className={cn(getFieldError("vat_info.phone_number") && "border-destructive")}
                    />
                  }
                />
              </div>
            </CardContent>
          </Card>
        )}

        <p className="text-foreground text-start text-sm">{ordersTranslation.yourOrder.paymentMethod.description}</p>

        <div className="space-y-4">
          <div className="flex flex-col space-y-2">
            <div className="flex items-center space-x-2">
              <Checkbox
                name="agreements.terms"
                id="terms_accepted"
                checked={values.agreements.terms}
                onCheckedChange={(checked) => setFieldValue("agreements.terms", !!checked)}
                className={cn(getFieldError("agreements.terms") && "border-destructive")}
              />
              <Label htmlFor="terms_accepted" className="text-foreground text-sm leading-relaxed">
                {ordersTranslation.yourOrder.paymentMethod.agreement}
                <Link className="underline" target="_blank" href="/terms-of-service">
                  {termsTranslation.termsOfService.title}
                </Link>
                and
                <Link className="underline" target="_blank" href="/privacy-policy">
                  {termsTranslation.privacyPolicy.title}
                </Link>
              </Label>
            </div>
            {getFieldError("agreements.terms") && (
              <p className="text-sm text-red-600">{getFieldError("agreements.terms")}</p>
            )}
          </div>

          <div className="flex items-center space-x-2">
            <Checkbox
              name="agreements.consent"
              id="consent_accepted"
              checked={values.agreements.consent}
              onCheckedChange={(checked) => setFieldValue("agreements.consent", !!checked)}
            />
            <Label htmlFor="consent_accepted" className="text-foreground text-sm leading-relaxed">
              {ordersTranslation.yourOrder.paymentMethod.consent}
            </Label>
          </div>

          <div className="flex items-center space-x-2">
            <Checkbox
              name="agreements.create_profile"
              id="create_profile"
              checked={values.agreements.create_profile}
              onCheckedChange={(checked) => setFieldValue("agreements.create_profile", !!checked)}
            />
            <Label htmlFor="create_profile" className="text-foreground text-sm leading-relaxed">
              {ordersTranslation.yourOrder.paymentMethod.createProfile}
            </Label>
          </div>
        </div>

        <Button
          type="submit"
          variant="blue"
          size="lg"
          className="mt-3 w-full"
          disabled={formik.isSubmitting || !values.agreements.terms}
        >
          {ordersTranslation.summaryTranslation.placeOrderFor} {baseCalculation.total.toFixed(2)}{" "}
          {commonTranslation.cad}
        </Button>
      </div>
    </form>
  );
}
