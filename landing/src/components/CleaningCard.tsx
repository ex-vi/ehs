"use client";

import { AlertTriangle, Info } from "lucide-react";
import Image from "next/image";

import { cn } from "@/core/lib/utils";
import { Card } from "@/components/ui/card";
import {
  CLEANING_CARDS,
  CleaningCardData,
  CleaningVariant,
  HowWeCountExample,
} from "@/views/orders/create/utils/constants";

type CleaningCardProps = {
  variant: CleaningVariant;
  defaultOpen?: boolean;
  className?: string;
};

const Hero = ({ src, alt = "Cleaning service" }: { src?: string; alt?: string }) => {
  if (!src) {
    return (
      <div className="flex aspect-4/3 w-full items-center justify-center">
        <div className="text-4xl text-gray-400">🏠</div>
      </div>
    );
  }

  return (
    <div className="flex h-full w-full items-start justify-center">
      <Image src={src} alt={alt} width={200} height={200} className="object-cover" />
    </div>
  );
};

const SectionList = ({
  title,
  items,
  titleClassName = "text-sm font-medium",
}: {
  title: string;
  items: readonly string[];
  titleClassName?: string;
}) => (
  <div className={cn("mb-4")}>
    <h4 className={cn("mb-2 leading-6", titleClassName)}>{title}</h4>
    <ul className="list-disc pl-5 text-sm leading-5">
      {items.map((item, index) => (
        <li key={index}>{item}</li>
      ))}
    </ul>
  </div>
);

const ElementList = ({
  title,
  elements,
  titleClassName = "text-sm font-medium",
}: {
  title: string;
  elements: readonly { title: string; includes: string[] }[];
  titleClassName?: string;
}) => (
  <div className={cn("mb-4")}>
    <h4 className={cn("mb-2 leading-6", titleClassName)}>{title}</h4>
    <ul className="list-disc text-sm leading-5">
      {elements.map((item, index) => (
        <div key={index} className="mb-3">
          <h5 key={index} className="my-2 font-semibold">
            {item.title}
          </h5>
          {item.includes.map((subItem, subIndex) => (
            <li className="ml-7" key={subIndex}>
              {subItem}
            </li>
          ))}
        </div>
      ))}
    </ul>
  </div>
);

const InfoPill = ({ children }: { children: React.ReactNode }) => (
  <div className="border-esg-blue bg-background flex items-center gap-2 rounded-lg border px-3 py-2 text-sm leading-5">
    <Info className="text-esg-blue h-4 w-4 shrink-0" />
    <p className="text-esg-blue">{children}</p>
  </div>
);

const WarningPill = ({ children }: { children: React.ReactNode }) => (
  <div className="bg-background flex items-center gap-2 rounded-lg border border-amber-600 px-3 py-2 text-sm leading-5">
    <AlertTriangle className="h-4 w-4 shrink-0 text-amber-600" />
    <p className="text-amber-600">{children}</p>
  </div>
);

const ExamplesGrid = ({ examples }: { examples: HowWeCountExample[] }) => (
  <div className="mb-4 grid grid-cols-2 gap-3">
    {examples.map((example, index) => (
      <Card key={index} className="rounded-lg p-2">
        <div className="mb-2 aspect-4/3 overflow-hidden">
          {example.image ? (
            <Image
              src={example.image}
              alt={example.label}
              width={120}
              height={90}
              className="h-full w-full object-fill"
            />
          ) : (
            <div className="flex h-full w-full items-center justify-center bg-gray-100">
              <div className="text-lg text-gray-400">🪟</div>
            </div>
          )}
        </div>
        <p className="text-xs leading-4 font-semibold">{example.label}</p>
      </Card>
    ))}
  </div>
);

export function CleaningCard({ variant, defaultOpen = false, className }: CleaningCardProps) {
  const data = CLEANING_CARDS[variant] as CleaningCardData | undefined;

  if (!data) {
    return null;
  }

  return (
    <div className="grid grid-cols-1 gap-6 md:grid-cols-3">
      <div>
        <Hero src={data.hero} alt={data.title} />
      </div>

      <div className="text-foreground md:col-span-2">
        <h3 className="mb-2 text-lg leading-6 font-semibold">{data.title}</h3>
        <p className="mb-4 text-sm leading-5">{data.tagline}</p>

        {/* {variant === "staircases" && data.whatsIncluded && (
          <SectionList titleClassName="font-semibold text-lg" title="What's included:" items={data.whatsIncluded} />
        )} */}

        {/* {variant === "office" && data.whatsIncluded && (
          <SectionList
            titleClassName="text-sm font-medium leading-none mb-1"
            title="We can:"
            items={data.whatsIncluded}
          />
        )} */}

        {/* {variant === "office" && data.whatsIncluded && (
          <SectionList titleClassName="font-semibold text-lg" title="What's included:" items={[]} />
        )}

        {variant === "after-renovation" && (
          <SectionList titleClassName="font-semibold text-lg" title="What's included:" items={[]} />
        )} */}

        {/* {(variant === "deep" || variant === "after-renovation" || variant === "kitchen") && data.sections?.includes && ( */}
        {variant === "deep" && data.sections?.includes && (
          <SectionList
            titleClassName="font-semibold text-lg"
            title="What's included:"
            items={data.sections.includes as string[]}
          />
        )}

        {variant === "kitchen" && data.elements && (
          <ElementList titleClassName="font-semibold text-lg" title="What's included:" elements={data.elements} />
        )}

        {/* {variant === "office" && data.sections && (
          <>
            {data.sections.standardOffice && (
              <div className="mb-4">
                <div className="mb-2 flex items-center gap-2">
                  {data.sections.standardOffice.image && (
                    <Image
                      src={data.sections.standardOffice.image}
                      alt={data.sections.standardOffice.title}
                      width={24}
                      height={24}
                    />
                  )}
                  <h4 className="text-sm leading-6 font-medium">{data.sections.standardOffice.title}</h4>
                </div>
                <ul className="list-disc pl-5 text-sm leading-5">
                  {data.sections.standardOffice.items.map((item: string, index: number) => (
                    <li key={index}>{item}</li>
                  ))}
                </ul>
              </div>
            )}

            {data.sections.deepOffice && (
              <div className="mb-4">
                <div className="mb-2 flex items-center gap-2">
                  {data.sections.deepOffice.image && (
                    <Image
                      src={data.sections.deepOffice.image}
                      alt={data.sections.deepOffice.title}
                      width={24}
                      height={24}
                    />
                  )}
                  <h4 className="text-sm leading-6 font-medium">{data.sections.deepOffice.title}</h4>
                </div>
                <ul className="list-disc pl-5 text-sm leading-5">
                  {data.sections.deepOffice.items.map((item: string, index: number) => (
                    <li key={index}>{item}</li>
                  ))}
                </ul>
              </div>
            )}
          </>
        )} */}

        {variant === "move-in" && data.sections && (
          <>
            {data.sections.livingAreas && (
              <div className="mb-4">
                <SectionList title={data.sections.livingAreas.title} items={data.sections.livingAreas.items} />
              </div>
            )}

            {data.sections.kitchenBath && (
              <div className="mb-4">
                <SectionList title={data.sections.kitchenBath.title} items={data.sections.kitchenBath.items} />
              </div>
            )}

            {data.sections.bathroom && (
              <div className="mb-4">
                <SectionList title={data.sections.bathroom.title} items={data.sections.bathroom.items} />
              </div>
            )}
          </>
        )}

        {variant === "standard" && data.sections && (
          <>
            {data.sections.room && (
              <div className="mb-4">
                <SectionList title={data.sections.room.title} items={data.sections.room.items} />
              </div>
            )}

            {data.sections.bathroom && (
              <div className="mb-4">
                <SectionList title={data.sections.bathroom.title} items={data.sections.bathroom.items} />
              </div>
            )}

            {data.sections.hallway && (
              <div className="mb-4">
                <SectionList title={data.sections.hallway.title} items={data.sections.hallway.items} />
              </div>
            )}
            {data.sections.kitchen && (
              <div className="mb-4">
                <SectionList title={data.sections.kitchen.title} items={data.sections.kitchen.items} />
              </div>
            )}
          </>
        )}

        {/* {variant === "after-renovation" && data.sections && (
          <>
            {data.sections.kitchen && (
              <div className="mb-4">
                <SectionList title={data.sections.kitchen.title} items={data.sections.kitchen.items} />
              </div>
            )}

            {data.sections.bathroom && (
              <div className="mb-4">
                <SectionList title={data.sections.bathroom.title} items={data.sections.bathroom.items} />
              </div>
            )}

            {data.sections.living && (
              <div className="mb-4">
                <SectionList title={data.sections.living.title} items={data.sections.living.items} />
              </div>
            )}
          </>
        )} */}

        {variant === "windows" && data.howWeCount && (
          <>
            <div className="mb-4">
              <h4 className="mb-2 text-lg leading-6 font-semibold">How we count your windows:</h4>
              <p className="mb-4 text-sm leading-5">{data.howWeCount.intro}</p>

              <ExamplesGrid examples={data.howWeCount.examples} />

              {data.howWeCount.rules && (
                <ul className="mb-4 list-disc pl-5 text-sm leading-5">
                  {data.howWeCount.rules.map((rule: string, index: number) => (
                    <li key={index}>{rule}</li>
                  ))}
                </ul>
              )}

              {data.howWeCount.notes && data.howWeCount.notes.length > 0 && (
                <ul className="list-disc pl-5 text-sm leading-5">
                  {data.howWeCount.notes.map((note: string, index: number) => (
                    <li key={index}>{note}</li>
                  ))}
                </ul>
              )}
            </div>
          </>
        )}

        {data.notes && data.notes.length > 0 && (
          <div className="space-y-2">
            {data.notes.map((note: string, index: number) => (
              <WarningPill key={index}>{note}</WarningPill>
            ))}
          </div>
        )}

        {data.addOns && data.addOns.length > 0 && (
          <div className="space-y-2">
            {data.addOns.map((addon: string, index: number) => (
              <InfoPill key={index}>{addon}</InfoPill>
            ))}
          </div>
        )}
      </div>
    </div>
  );
}

export function CleaningCardsGallery() {
  const variants = Object.keys(CLEANING_CARDS) as CleaningVariant[];

  return (
    <div className="space-y-8">
      <h2 className="text-center text-2xl font-bold">Cleaning Services Overview</h2>
      <div className="grid grid-cols-1 gap-6 lg:grid-cols-2 xl:grid-cols-3">
        {variants.map((variant) => (
          <CleaningCard key={variant} variant={variant} defaultOpen={false} />
        ))}
      </div>
    </div>
  );
}
