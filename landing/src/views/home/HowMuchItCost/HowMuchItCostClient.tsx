"use client";

import { useEffect, useState } from "react";
import Link from "next/link";
import { useRouter, useSearchParams } from "next/navigation";

import { cn } from "@/core/lib/utils";
import { Coefficient } from "@/core/models/coefficients";
import { Service } from "@/core/models/services";
import { commonTranslation } from "@/core/translations/common";
import { getDiscountPercentageFromCoefficient } from "@/core/utils/getCoefficient";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";

type Props = {
  coefficients?: Coefficient[] | null;
  standardService?: Service | null;
};

export default function HowMuchItCostClient({ coefficients, standardService }: Props) {
  const searchParams = useSearchParams();
  const router = useRouter();

  const initialFrequency = searchParams.get("frequency") ?? commonTranslation.howMuchItCost.tabs[0].slug;

  const [activeTab, setActiveTab] = useState(initialFrequency);

  useEffect(() => {
    const params = new URLSearchParams(searchParams.toString());
    params.set("frequency", activeTab);

    router.replace(`?${params.toString()}`, { scroll: false });
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [activeTab]);

  const buildUrl = (rooms: number) => {
    const params = new URLSearchParams(searchParams.toString());
    params.set("rooms", String(rooms));
    params.set("frequency", activeTab);
    return `/orders/create?${params.toString()}`;
  };

  return (
    <section id="prices" className="bg-background section-padding-y scroll-mt-14">
      <div className="container-padding-x container mx-auto flex flex-col gap-10 md:gap-12">
        <div className="section-title-gap-lg mx-auto flex max-w-xl flex-col items-center text-center">
          <h2 className="heading-lg">{commonTranslation.howMuchItCost.title}</h2>

          <p className="text-muted-foreground">{commonTranslation.howMuchItCost.description}</p>
        </div>

        <div className="flex w-full justify-center">
          <Tabs
            orientation="horizontal"
            defaultValue={initialFrequency}
            value={activeTab}
            onValueChange={setActiveTab}
            className="w-full md:max-w-[820px]"
          >
            <TabsList className="grid h-full w-full grid-cols-1 p-0 shadow-none md:h-14 md:grid-cols-4">
              {commonTranslation.howMuchItCost.tabs.map(({ slug, title }, index) => {
                const coefficient = coefficients?.find((c) => c.slug === slug);
                const percent = coefficient ? getDiscountPercentageFromCoefficient(coefficient.coefficient) : 0;

                return (
                  <TabsTrigger
                    key={index}
                    value={slug}
                    className="data-[state=active]:text-primary-foreground data-[state=active]:bg-blue h-9 text-sm font-medium md:h-full"
                  >
                    {title}{" "}
                    {coefficient?.coefficient && coefficient.coefficient < 1 && (
                      <Badge
                        variant="blue"
                        className={cn(
                          activeTab === slug && "bg-[#09233A]",
                          "ml-1 rounded-full px-2 py-0.5 text-xs font-semibold!"
                        )}
                      >
                        -{percent}%
                      </Badge>
                    )}
                  </TabsTrigger>
                );
              })}
            </TabsList>
          </Tabs>
        </div>

        <div className="grid grid-cols-1 gap-3 lg:grid-cols-3">
          {commonTranslation.howMuchItCost.cards.map(({ rooms, title, description }, index) => {
            const base = standardService?.service_price ?? 0;
            const additionalRooms = Math.max(0, (rooms ?? 1) - 1);
            const subtotal = base + additionalRooms * (standardService?.extra_bedroom_price ?? 0);

            const discountCoeff = coefficients?.find((c) => c.slug === activeTab)?.coefficient ?? 1;
            const total = subtotal * discountCoeff;

            const display = `${Math.round(total)} ${commonTranslation.cad}`;

            return (
              <Card key={index} className="bg-muted overflow-hidden rounded-xl border-0 p-0 shadow-none">
                <CardContent className="flex flex-col gap-2 py-6">
                  <h3 className="text-foreground text-xl font-semibold">{title}</h3>
                  <p className="text-muted-foreground text-sm font-normal">{description}</p>

                  <p className="text-muted-foreground text-center text-base font-normal">
                    {commonTranslation.from}{" "}
                    <span className="text-foreground -mb-0.5 text-2xl font-bold">{display}</span>
                  </p>

                  {/* ------------- BOOK NOW with all query params ------------- */}
                  <Link className="w-full" href={buildUrl(rooms ?? 1)}>
                    <Button className="mt-4 w-full" variant="blue">
                      {commonTranslation.bookNow}
                    </Button>
                  </Link>
                </CardContent>
              </Card>
            );
          })}
        </div>
      </div>
    </section>
  );
}
