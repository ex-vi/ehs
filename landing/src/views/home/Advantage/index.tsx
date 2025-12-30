import { DynamicIcon } from "lucide-react/dynamic";

import { Advantage } from "@/core/models/advantages";
import { cmsClient } from "@/core/services/cmsClient";
import { commonTranslation } from "@/core/translations/common";

export async function fetchAdvantages(): Promise<Advantage[]> {
  try {
    const res = await cmsClient("/advantages");
    return res?.data || [];
  } catch (error) {
    console.error("Failed to fetch advantages:", error);
    return [];
  }
}

export default async function WhyChooseUs() {
  const advantages = await fetchAdvantages();

  return (
    <section id="why-us" className="bg-background section-padding-y scroll-mt-14">
      <div className="container-padding-x container mx-auto flex flex-col gap-10 md:gap-12">
        <div className="section-title-gap-lg mx-auto flex max-w-xl flex-col items-center text-center">
          <h2 className="heading-lg text-foreground">{commonTranslation.whyChooseUs.title}</h2>
          <p className="text-muted-foreground text-base">{commonTranslation.whyChooseUs.description}</p>
        </div>
        <div className="grid grid-cols-1 gap-8 md:grid-cols-2 md:gap-6 lg:grid-cols-4">
          {advantages?.map(({ title, description, icon_slug }, index) => {
            return (
              <div key={index} className="bg-muted flex flex-col items-start gap-5 rounded-md p-6 text-start">
                <div className="bg-background flex h-10 w-10 shrink-0 items-center justify-center rounded-md border shadow-xs">
                  <DynamicIcon name={icon_slug as any} className="text-[#006CCC]" size={20} />
                </div>
                <div className="flex flex-col gap-2">
                  <h3 className="text-foreground font-semibold">{title}</h3>
                  <p className="text-muted-foreground">{description}</p>
                </div>
              </div>
            );
          })}
        </div>
      </div>
    </section>
  );
}
