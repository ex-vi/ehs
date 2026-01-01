"use client";

import { useEffect, useRef } from "react";

import { useScrollSpy, type SectionId } from "@/core/hooks/useScrollSpy";
import { cn } from "@/core/lib/utils";
import { ordersTranslation } from "@/core/translations/orders";
import { Breadcrumb, BreadcrumbItem, BreadcrumbList, BreadcrumbSeparator } from "@/components/ui/breadcrumb";

import "./FixedBreadcrumbs.css";

import { commonTranslation } from "@/core/translations/common";
import { Badge } from "@/components/ui/badge";

const STEP_SECTIONS: Record<string, SectionId[]> = {
  first: ["details", "place", "datetime", "frequency", "options"],
  second: ["address", "contact"],
  third: ["payment"],
};

export default function FixedBreadcrumbs({ total }: { total: number }) {
  const { activeSection, scrollToSection } = useScrollSpy(300);

  const formattedTotal = Number.isFinite(total) ? total.toFixed(2) : "0.00";

  const listRef = useRef<HTMLOListElement>(null);
  const firstRef = useRef<HTMLLIElement>(null);
  const secondRef = useRef<HTMLLIElement>(null);
  const thirdRef = useRef<HTMLLIElement>(null);

  const getActiveStep = (current: SectionId): "first" | "second" | "third" => {
    for (const [step, sections] of Object.entries(STEP_SECTIONS)) {
      if (sections.includes(current)) return step as "first" | "second" | "third";
    }
    return "first";
  };

  const activeStep = getActiveStep(activeSection);

  useEffect(() => {
    const el =
      activeStep === "first" ? firstRef.current : activeStep === "second" ? secondRef.current : thirdRef.current;

    if (!el) return;

    const inline: ScrollLogicalPosition = activeStep === "first" ? "start" : activeStep === "second" ? "center" : "end";

    el.scrollIntoView({
      behavior: "smooth",
      block: "nearest",
      inline,
    });
  }, [activeStep]);

  const handleStepClick = (step: "first" | "second" | "third") => {
    const firstSection = STEP_SECTIONS[step]?.[0];
    if (firstSection) scrollToSection(firstSection);
  };

  const handleScrollToSummary = () => {
    const el = document.getElementById("summary");
    if (!el) return;
    el.scrollIntoView({ behavior: "smooth", block: "start" });
  };

  return (
    <div className="sticky top-16 z-40 mb-6 lg:top-19">
      <div className="bg-background flex w-full justify-between pb-3 lg:hidden">
        <div className="section-title-gap-lg">
          <h2 className="heading-lg">{ordersTranslation.yourOrder.title}</h2>
        </div>
        <Badge asChild className="text-blue bg-[#F2F4F7] px-4 py-2 text-sm font-bold">
          <button type="button" onClick={handleScrollToSummary}>
            Total {formattedTotal} {commonTranslation.cad}
          </button>
        </Badge>
      </div>
      <Breadcrumb className="rounded-md">
        <BreadcrumbList
          ref={listRef}
          className={cn(
            "text-muted-foreground flex-nowrap overflow-x-auto rounded-md bg-[#F2F4F7] p-0.5",
            "no-scrollbar h-12 scroll-smooth"
          )}
        >
          <BreadcrumbItem
            ref={firstRef}
            className={cn(
              "flex-1 cursor-pointer scroll-mx-2 justify-center transition-all duration-200",
              activeStep === "first" && "bg-blue text-background h-full rounded-md"
            )}
            onClick={() => handleStepClick("first")}
            aria-current={activeStep === "first" ? "page" : undefined}
          >
            <span className="px-4 py-2 text-nowrap">{ordersTranslation.yourOrder.step.first}</span>
          </BreadcrumbItem>

          <BreadcrumbSeparator />

          <BreadcrumbItem
            ref={secondRef}
            className={cn(
              "flex-1 cursor-pointer scroll-mx-2 justify-center transition-all duration-200",
              activeStep === "second" && "bg-blue text-background h-full rounded-md"
            )}
            onClick={() => handleStepClick("second")}
            aria-current={activeStep === "second" ? "page" : undefined}
          >
            <span className="px-4 py-2 text-nowrap">{ordersTranslation.yourOrder.step.second}</span>
          </BreadcrumbItem>

          <BreadcrumbSeparator />

          <BreadcrumbItem
            ref={thirdRef}
            className={cn(
              "flex-1 cursor-pointer scroll-mx-2 justify-center transition-all duration-200",
              activeStep === "third" && "bg-blue text-background h-full rounded-md"
            )}
            onClick={() => handleStepClick("third")}
            aria-current={activeStep === "third" ? "page" : undefined}
          >
            <span className="px-4 py-2 text-nowrap">{ordersTranslation.yourOrder.step.third}</span>
          </BreadcrumbItem>
        </BreadcrumbList>
      </Breadcrumb>
    </div>
  );
}
