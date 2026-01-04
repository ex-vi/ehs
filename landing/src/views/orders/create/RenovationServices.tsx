"use client";

import { useEffect, useState } from "react";
import Image from "next/image";

import { cn } from "@/core/lib/utils";
import { Service } from "@/core/models/services";
import { commonTranslation } from "@/core/translations/common";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Input } from "@/components/ui/input";

import "@/styles/input-no-arrows.css";

import { RENOVATION_SERVICES_ORDER } from "@/core/constants/common";

export type RenovationServiceSlug = string;

export const renovationServiceIconMap: Record<string, string> = {
  painting: "/icons/painting.svg",
  "laminate-flooring": "/icons/laminate.svg",
  "baseboard-installation": "/icons/baseboard.svg",
  "drywall-installation": "/icons/drywall.svg",
  "vinyl-siding": "/icons/siding.svg",
  insulations: "/icons/insulation.svg",
};

type RenovationServiceDescription = {
  consistsOf: {
    title: "What does the service consist of?";
    sections: {
      title?: string;
      description?: string;
      items?: string[];
    }[];
  };
  mayIncreasePrice: {
    title: "Which may increase the final price?";
    sections: {
      title?: string;
      items: string[];
    }[];
  };
};

export const renovationServiceDescriptionMap: Record<RenovationServiceSlug, RenovationServiceDescription> = {
  painting: {
    consistsOf: {
      title: "What does the service consist of?",
      sections: [
        {
          title: "Standard wall painting",
          description: "A complete wall refresh with surface preparation and quality finish.",
          items: [
            "Furniture protection",
            "Edge taping and masking",
            "Minor patching and crack filling",
            "Light sanding for a smoother surface",
            "Primer applied where needed",
            "2–3 coats of paint (roller + brush work)",
            "Coverage inspection and touch-ups",
            "Clean-up after completion",
          ],
        },
      ],
    },
    mayIncreasePrice: {
      title: "Which may increase the final price?",
      sections: [
        {
          items: [
            "walls require extensive repairs",
            "full sanding or priming is needed",
            "high ceilings or stairwell areas",
            "dark-to-light colour change (extra coats)",
            "furniture or access restrictions",
          ],
        },
      ],
    },
  },

  "laminate-flooring": {
    consistsOf: {
      title: "What does the service consist of?",
      sections: [
        {
          description: "Professional floor installation with clean fitting and finish.",
          items: [
            "Subfloor condition check",
            "Underlayment installation",
            "Cutting boards to size",
            "Click-locking and fitting boards into place",
            "Installing transitions/thresholds (1–2 pieces)",
            "Minor seam corrections",
            "Clean-up of the work area",
          ],
        },
      ],
    },
    mayIncreasePrice: {
      title: "Which may increase the final price?",
      sections: [
        {
          items: [
            "floor needs leveling",
            "diagonal / 45° / herringbone patterns",
            "multiple doorways or cutting details",
            "heavy furniture must be moved",
          ],
        },
      ],
    },
  },

  "baseboard-installation": {
    consistsOf: {
      title: "What does the service consist of?",
      sections: [
        {
          title: "Standard baseboard installation",
          description: "Neat trim work to finish the room properly.",
          items: [
            "Measuring and cutting to size",
            "Inside and outside corner fitting",
            "Mounting baseboards to walls",
            "Caulking seams and nail holes",
            "Spot painting touch-ups if needed",
            "Clean-up",
          ],
        },
      ],
    },
    mayIncreasePrice: {
      title: "Which may increase the final price?",
      sections: [
        {
          items: [
            "oversized or decorative trim profiles",
            "uneven walls requiring scribing",
            "integration with door casing",
            "stair trim or complex angles",
          ],
        },
      ],
    },
  },

  "drywall-installation": {
    consistsOf: {
      title: "What does the service consist of?",
      sections: [
        {
          title: "Standard drywall installation & finish",
          description: "Drywall installation with finishing ready for paint.",
          items: [
            "Sheet cutting and mounting",
            "Fastening to framing",
            "Joint taping",
            "2–3 coats of mudding to smooth joints",
            "Sanding for flat finish",
            "Priming before paint",
          ],
        },
      ],
    },
    mayIncreasePrice: {
      title: "Which may increase the final price?",
      sections: [
        {
          items: [
            "framing is uneven or needs correction",
            "high ceilings or stairwell work",
            "sound/fire-rated drywall is requested",
            "multiple cut-outs (lights, boxes, vents)",
            "full skim coat needed for smooth walls",
          ],
        },
      ],
    },
  },

  insulations: {
    consistsOf: {
      title: "What does the service consist of?",
      sections: [
        {
          title: "Standard wall insulation",
          description: "Energy-efficient insulation for improved comfort and heat retention.",
          items: [
            "Batt/mineral wool insulation installation",
            "Full cavity fill without gaps",
            "Minor vapor barrier sealing if required",
            "Clean-up after work",
          ],
        },
        {
          title: "Standard attic insulation",
          description: "Boosting attic insulation for better R-value and efficiency.",
          items: [
            "Existing insulation check",
            "Adding or blowing in new insulation",
            "Leveling and distributing evenly",
            "Clean-up after work",
          ],
        },
      ],
    },
    mayIncreasePrice: {
      title: "Which may increase the final price?",
      sections: [
        {
          title: "Wall insulation",
          items: [
            "old insulation must be removed",
            "narrow or obstructed cavities",
            "additional vapour barrier or double-layer insulation",
          ],
        },
        {
          title: "Attic insulation",
          items: [
            "limited attic access",
            "removal of old insulation required",
            "baffles or ventilation needed",
            "low headroom / tight crawl space",
          ],
        },
      ],
    },
  },

  "vinyl-siding": {
    consistsOf: {
      title: "What does the service consist of?",
      sections: [
        {
          title: "Standard siding installation",
          description: "Exterior siding installation with clean finishes.",
          items: [
            "Starter strip level set-up",
            "Panel installation using proper expansion gaps",
            "Cutting and trimming around windows/corners",
            "Seam sealing where required",
            "Installing finishing trims",
            "Clean-up of work area",
          ],
        },
      ],
    },
    mayIncreasePrice: {
      title: "Which may increase the final price?",
      sections: [
        {
          items: [
            "house is 2–3 stories or hard to access",
            "old siding must be removed",
            "uneven surfaces",
            "lots of cutting (balconies, gables, porches)",
            "fibre-cement products (heavier material)",
          ],
        },
      ],
    },
  },
};

interface RenovationServicesProps {
  services?: Service[];
  onChange?: (renovationData: Record<string, Service & { sqft: number }>) => void; // отправляем полные Service объекты с sqft
}

// Функция маппинга больше не нужна - работаем напрямую с Service объектами
// function mapServiceToRenovationService(service: Service) { ... }

export function RenovationServices({ services = [], onChange }: RenovationServicesProps) {
  // Больше не нужен маппинг - работаем напрямую с Service объектами
  // const mappedServices = services.map(mapServiceToRenovationService);

  const [values, setValues] = useState<Record<string, string>>({});
  // const [addOns, setAddOns] = useState<Record<string, boolean>>({}); // не используется в новой логике

  // TEMPORARY: Update parent form when renovation data changes
  useEffect(() => {
    if (onChange) {
      const renovationData: Record<string, Service & { sqft: number }> = {};

      services.forEach((service) => {
        const sqft = parseInt(values[service.slug] || "0", 10);
        if (sqft > 0) {
          // отправляем полный Service объект с добавленным sqft
          renovationData[service.slug] = {
            ...service, // полный Service со всеми полями (включая estimates)
            sqft, // добавляем sqft
          };
        }
      });

      onChange(renovationData);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [values]);

  const toggleService = (slug: string) => {
    const isActive = values[slug] !== undefined;
    if (isActive) {
      // Если активна - полностью деактивируем (убираем из состояния)
      setValues((prev) => {
        const newValues = { ...prev };
        delete newValues[slug];
        return newValues;
      });
    } else {
      // Если не активна - активируем с 0 (избегаем принудительного min=1 поведения)
      setValues((prev) => ({
        ...prev,
        [slug]: "0",
      }));
    }
  };

  const updateValue = (slug: string, value: string) => {
    setValues((prev) => ({ ...prev, [slug]: value }));
  };

  return (
    <>
      <div className="grid grid-cols-1 gap-3 sm:hidden">
        {RENOVATION_SERVICES_ORDER.map((slug) => services.find((service) => service.slug === slug))
          .filter((service) => service !== undefined)
          .map((service) => {
            const isActive = values[service.slug] !== undefined;

            return (
              <div
                key={service.slug}
                onClick={() => toggleService(service.slug)}
                className={cn(
                  "cursor-pointer rounded-lg border transition-all hover:border-blue-400",
                  "h-[140px] w-full",
                  "p-2",
                  isActive ? "bg-blue text-white" : "bg-background"
                )}
              >
                <div className="flex h-full flex-col justify-between space-y-3">
                  <div className="relative flex h-full items-center justify-center">
                    {isActive ? (
                      <div className="flex w-full justify-center">
                        <div onClick={(e) => e.stopPropagation()} className="relative flex items-center gap-1">
                          <Input
                            type="number"
                            className="bg-background text-foreground h-8 w-32 pr-8 text-center text-sm"
                            placeholder="0"
                            value={values[service.slug] || ""}
                            onChange={(e) => updateValue(service.slug, e.target.value)}
                            min="0"
                          />
                          <span className="text-muted-foreground absolute top-1/2 right-2 -translate-y-1/2 text-xs">
                            sq ft
                          </span>
                        </div>
                      </div>
                    ) : (
                      <div className="">
                        <Image
                          src={renovationServiceIconMap[service.slug] || "/icons/default.svg"}
                          width={36}
                          height={36}
                          alt={service.name}
                        />
                      </div>
                    )}
                  </div>

                  <div className="flex flex-col items-center justify-center gap-1">
                    <p
                      className={cn(
                        "line-clamp-2 text-center text-xs font-medium",
                        isActive ? "text-white" : "text-foreground"
                      )}
                    >
                      {service.name}
                    </p>
                    <Button
                      type="button"
                      variant={"secondary"}
                      className={cn("text-blue w-fit")}
                      onClick={(e) => {
                        e.stopPropagation();
                        toggleService(service.slug);
                      }}
                    >
                      {service.sqft_price} {commonTranslation.cad}/sq ft
                    </Button>
                  </div>
                </div>
              </div>
            );
          })}
      </div>

      <div className="hidden space-y-4 sm:block">
        {RENOVATION_SERVICES_ORDER.map((slug) => services.find((service) => service.slug === slug))
          .filter((service) => service !== undefined)
          .map((service) => (
            <Card key={service.slug} className="flex flex-row items-start justify-between gap-4 rounded-xl p-4">
              <div className="flex flex-1 items-start gap-4">
                <div className="mt-1 h-10 w-10 shrink-0">
                  <Image
                    src={renovationServiceIconMap[service.slug] || "/icons/default.svg"}
                    width={40}
                    height={40}
                    alt={service.name}
                    className="object-contain"
                  />
                </div>

                <div>
                  <p className="text-sm font-medium">{service.name}</p>
                  <p className="mt-1 text-xs">from {service.sqft_price} CAD / sqft</p>
                </div>
              </div>

              <div className="relative flex w-28 items-center gap-1">
                <Input
                  type="number"
                  className="bg-background h-10 pr-10"
                  placeholder="0"
                  value={values[service.slug] || ""}
                  onChange={(e) => updateValue(service.slug, e.target.value)}
                />
                <p className="absolute top-2 right-2 text-sm">sq ft</p>
              </div>
            </Card>
          ))}
      </div>
    </>
  );
}
