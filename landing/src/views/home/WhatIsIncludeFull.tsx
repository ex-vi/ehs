import { Check } from "lucide-react";
import Link from "next/link";

import { fetchCoefficients } from "@/core/api/coefficients";
import { fetchServices } from "@/core/api/services";
import { cn } from "@/core/lib/utils";
import { commonTranslation } from "@/core/translations/common";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";

export default async function WhatIsIncludeFull({ searchParams = {} }: { searchParams?: Record<string, string> }) {
  const services = await fetchServices();
  const coefficients = await fetchCoefficients();

  const frequency = searchParams.frequency ?? "discount-once";
  const coefficient = coefficients?.find((c) => c.slug === frequency)?.coefficient ?? 1;

  const buildUrl = (slug: string) => {
    const params = new URLSearchParams(searchParams as any);
    params.set("service", slug);
    return `/orders/create?${params.toString()}`;
  };

  return (
    <section
      id="included-full"
      className="bg-background section-padding-y scroll-mt-14"
      aria-labelledby="pricing-section-title"
    >
      <div className="container-padding-x container mx-auto">
        <div className="flex flex-col items-center gap-10 md:gap-12">
          <div className="section-title-gap-lg flex max-w-xl flex-col items-center text-center">
            <h2 id="pricing-section-title" className="heading-lg text-foreground">
              {commonTranslation.whatIsIncludeFull.title}
            </h2>
            <p className="text-muted-foreground text-base">{commonTranslation.whatIsIncludeFull.description}</p>
          </div>

          <div className="grid w-full grid-cols-1 gap-4 lg:max-w-5xl lg:grid-cols-3 lg:gap-6">
            {commonTranslation.whatIsIncludeFull.prices.map(({ slug, description, included, badge }, index) => {
              const currentService = services?.find((s) => s.slug === slug);
              if (!currentService) return null;

              const highlighted = index === 1;

              const discountedPrice = Math.round(currentService.service_price * coefficient);

              return (
                <Card key={index} className={cn("rounded-xl p-6 lg:p-8", highlighted && "bg-secondary")}>
                  <CardContent className="flex flex-col gap-8 p-0">
                    <div className="flex flex-col gap-6">
                      <div className="relative flex h-24 flex-col gap-3">
                        {badge && (
                          <Badge variant="blue" className="absolute top-1 right-0 w-fit py-[1px] text-xs font-semibold">
                            {badge}
                          </Badge>
                        )}
                        <h3 className={cn("text-lg font-semibold", highlighted && "text-primary")}>
                          {currentService.name}
                        </h3>
                        <p className="text-muted-foreground text-sm">{description}</p>
                      </div>

                      <div className="flex items-end gap-0.5">
                        <span className="-mb-0.5 text-4xl font-semibold">
                          {discountedPrice} {commonTranslation.cad}
                        </span>
                        <span className="text-muted-foreground ml-1 text-xs">{commonTranslation.forOneRoom}</span>
                      </div>

                      <Link href={buildUrl(slug)}>
                        <Button
                          variant={highlighted ? "blue" : "secondary"}
                          className={cn(!highlighted && "text-blue", "w-full")}
                        >
                          {commonTranslation.bookNow}
                        </Button>
                      </Link>
                    </div>

                    <div className="flex flex-col gap-4">
                      <p className="text-sm font-medium">{commonTranslation.whatIsIncluded}</p>
                      <div className="flex flex-col gap-4">
                        {included.map((incl, i) => (
                          <div key={i} className="flex items-center gap-3">
                            <Check className="text-primary h-5 w-5" />
                            <span className="text-foreground flex-1 text-sm">{incl}</span>
                          </div>
                        ))}
                      </div>
                    </div>
                  </CardContent>
                </Card>
              );
            })}
          </div>
        </div>
      </div>
    </section>
  );
}
