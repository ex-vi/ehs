"use client";

import { Check } from "lucide-react";
import { useState } from "react";
import Image from "next/image";

import { Feature } from "@/core/models/features";
import { commonTranslation } from "@/core/translations/common";
import { AspectRatio } from "@/components/ui/aspect-ratio";
import { Tabs, TabsList, TabsTrigger } from "@/components/ui/tabs";

type Props = {
  features: Feature[] | null;
};

export default function WhatIsIncludeYourClient({ features }: Props) {
  const [activeTab, setActiveTab] = useState(commonTranslation.whatIsIncludeYour.tabs[0]);

  const currentTabContent = features?.find((f) => f.slug === activeTab);

  return (
    <section id="included" className="bg-background section-padding-y">
      <div className="container-padding-x container mx-auto flex flex-col gap-10 md:gap-12">
        <div className="section-title-gap-lg mx-auto flex max-w-xl flex-col items-center text-center">
          <h2 className="heading-lg md:w-[90%]">{commonTranslation.whatIsIncludeYour.title}</h2>

          <p className="text-muted-foreground">{commonTranslation.whatIsIncludeYour.description}</p>
        </div>

        <div className="flex w-full justify-center">
          <Tabs
            orientation="vertical"
            defaultValue={commonTranslation.whatIsIncludeYour.tabs[0]}
            onValueChange={setActiveTab}
            className="h-full w-full md:max-w-[820px]"
          >
            <TabsList className="grid h-full w-full grid-cols-1 p-0 shadow-none md:h-14 md:grid-cols-4">
              {features?.map(({ slug, title }, index) => (
                <TabsTrigger
                  key={index}
                  value={slug}
                  className="data-[state=active]:text-primary-foreground data-[state=active]:bg-blue h-9 md:h-full"
                >
                  {title}{" "}
                </TabsTrigger>
              ))}
            </TabsList>
          </Tabs>
        </div>
        <div className="w-full">
          <div className="mb-8 space-y-4 lg:hidden">
            {currentTabContent?.options.map(({ text }, index) => (
              <div key={index} className="flex items-center gap-3">
                <Check className="mt-1 h-5 w-5 flex-shrink-0" />
                <h3 className="text-sm font-normal md:text-base">{text}</h3>
              </div>
            ))}
          </div>

          <div className="w-full">
            <AspectRatio ratio={16 / 9}>
              <Image
                src={currentTabContent?.image_desktop.formats.large.url || "https://ui.shadcn.com/placeholder.svg"}
                alt={currentTabContent?.title || "Tab content image"}
                fill
                blurDataURL={currentTabContent?.image_desktop.formats.thumbnail.url}
                className="hidden h-full w-full rounded-xl object-contain lg:block"
              />
              <Image
                src={currentTabContent?.image_mobile.url || "https://ui.shadcn.com/placeholder.svg"}
                alt={currentTabContent?.title || "Tab content image"}
                fill
                blurDataURL={currentTabContent?.image_mobile.formats.thumbnail.url}
                className="h-full w-full rounded-xl object-cover lg:hidden"
              />
            </AspectRatio>
          </div>
        </div>
      </div>
    </section>
  );
}
