"use client";

import { useEffect, useState } from "react";

const SECTION_IDS = ["details", "place", "datetime", "frequency", "options", "address", "contact", "payment"] as const;

export type SectionId = (typeof SECTION_IDS)[number];

export function useScrollSpy(offset: number = 100) {
  const [activeSection, setActiveSection] = useState<SectionId>("details");

  useEffect(() => {
    const handleScroll = () => {
      const scrollPosition = window.scrollY + offset;

      for (let i = SECTION_IDS.length - 1; i >= 0; i--) {
        const sectionId = SECTION_IDS[i];
        const element = document.getElementById(sectionId);

        if (element) {
          const rect = element.getBoundingClientRect();
          const elementTop = rect.top + window.scrollY;

          if (scrollPosition >= elementTop) {
            setActiveSection(sectionId);
            break;
          }
        }
      }
    };

    handleScroll();

    window.addEventListener("scroll", handleScroll, { passive: true });
    return () => window.removeEventListener("scroll", handleScroll);
  }, [offset]);

  const scrollToSection = (sectionId: SectionId) => {
    const element = document.getElementById(sectionId);
    if (element) {
      const offsetTop = element.getBoundingClientRect().top + window.scrollY - offset;
      window.scrollTo({
        top: offsetTop + 100,
        behavior: "smooth",
      });
    }
  };

  return { activeSection, scrollToSection };
}
