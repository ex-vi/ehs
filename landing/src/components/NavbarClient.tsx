"use client";

import { Menu, X } from "lucide-react";
import { useEffect, useMemo, useState } from "react";
import Image from "next/image";
import Link from "next/link";

import { BUSINESS_SERVICE_ORDER, INDIVIDUAL_SERVICE_ORDER } from "@/core/constants/common";
import { cn } from "@/core/lib/utils";
import type { Service } from "@/core/models/services";
import { commonTranslation } from "@/core/translations/common";
import { ordersTranslation } from "@/core/translations/orders";
// import { ordersTranslation } from "@/core/translations/orders"; // не используется
import { Button } from "@/components/ui/button";

import { Logo } from "./logo";

export type ActionButton = {
  label: string;
  href: string;
  variant?: "default" | "outline" | "ghost" | "blue" | "secondary";
};

interface NavbarClientProps {
  services?: Service[] | null;
  actionButtons: readonly ActionButton[];
}

type MenuItem = {
  label: string;
  iconHref?: string;
  href: string;
};

type ServiceGroup = {
  title: string;
  services: MenuItem[];
};

const getServiceIcon = (slug: string): string => {
  const iconMap: Record<string, string> = {
    standard: "/services/standard.svg",
    deep: "/services/deep.svg",
    "move-in": "/services/packing.svg",
    "after-renovation": "/services/renovation.svg",
    renovations: "/services/renovation.svg",
    office: "/services/offices.svg",
    kitchen: "/services/kitchen-cabinets.svg",
    windows: "/services/window.svg",
    staircases: "/services/stairwells.svg",
  };

  return iconMap[slug] || "/services/standard.svg";
};

// const getServicesByOrder = (services: Service[], order: readonly string[]): Service[] => {
//   return order.map((slug) => services.find((service) => service.slug === slug)).filter(Boolean) as Service[];
// };

export default function NavbarClient({ services, actionButtons }: NavbarClientProps) {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  useEffect(() => {
    if (isMenuOpen) {
      document.body.style.overflow = "hidden";
    } else {
      document.body.style.overflow = "";
    }
    return () => {
      document.body.style.overflow = "";
    };
  }, [isMenuOpen]);

  const serviceGroups = useMemo<ServiceGroup[]>(() => {
    if (!services?.length) return [];

    const groups: ServiceGroup[] = [];

    const individualServices: MenuItem[] = [];
    INDIVIDUAL_SERVICE_ORDER.forEach((slug) => {
      const service = services.find((s) => s.slug === slug);
      if (service) {
        individualServices.push({
          label: service.name,
          iconHref: getServiceIcon(service.slug),
          href: `/orders/create?service=${service.slug}`,
        });
      }
    });

    if (individualServices.length > 0) {
      groups.push({
        title: ordersTranslation.cleaning,
        services: individualServices,
      });
    }

    const businessServices: MenuItem[] = [];
    BUSINESS_SERVICE_ORDER.forEach((slug) => {
      const service = services.find((s) => s.slug === slug);
      if (service) {
        businessServices.push({
          label: service.name,
          iconHref: getServiceIcon(service.slug),
          href: `/orders/create?service=${service.slug}`,
        });
      }
    });

    if (businessServices.length > 0) {
      groups.push({
        title: ordersTranslation.renovations,
        services: businessServices,
      });
    }

    return groups;
  }, [services]);

  const toggleMenu = () => setIsMenuOpen((prev) => !prev);

  const renderActionButtons = (className?: string) => (
    <div className={cn("flex items-center gap-2", className)}>
      {actionButtons.map((button, index) => (
        <Link key={index} href={button.href}>
          <Button variant={button.variant} className={className?.includes("w-full") ? "w-full" : undefined}>
            {button.label}
          </Button>
        </Link>
      ))}
    </div>
  );

  return (
    <>
      <nav
        className={cn(
          "bg-background/70 fixed top-0 isolate z-1000 w-full rounded-xl py-0 backdrop-blur-md",
          isMenuOpen && "rounded-none"
        )}
      >
        <div className="relative container m-auto flex flex-col justify-between gap-4 px-6 lg:flex-row lg:items-center lg:gap-6">
          <div className="flex items-center justify-between">
            <Link href="/" title={commonTranslation.toHomePage}>
              <Logo className="h-16 w-auto py-1 lg:h-16 lg:py-0" />
            </Link>
            <Button
              variant="ghost"
              className="flex size-9 items-center justify-center lg:hidden"
              onClick={toggleMenu}
              aria-label={isMenuOpen ? "Close menu" : "Open menu"}
            >
              {isMenuOpen ? <X /> : <Menu />}
            </Button>
          </div>
          <div className="hidden w-full flex-row justify-end gap-5 lg:flex">
            <div className="flex flex-col gap-1 lg:flex-row">
              {serviceGroups.map((group, index) => (
                <div key={index} className="flex flex-col lg:flex-row lg:items-center">
                  <div className="text-muted-foreground mb-2 text-xs font-medium lg:hidden">{group.title}</div>
                  <div className="flex flex-col gap-1 lg:flex-row">
                    {group.services.map(({ label, iconHref, href }) => (
                      <div key={label} className="relative">
                        <Link href={href} className="">
                          <Button
                            variant="ghost"
                            className="h-fit flex-col rounded-none p-2 text-sm hover:bg-black/10 lg:max-w-[90px] lg:min-w-20 lg:p-1.5 xl:max-w-24 xl:min-w-24"
                          >
                            {iconHref && <Image src={iconHref} alt={label} width={36} height={36} />}
                            <p className="text-sm">{label}</p>
                          </Button>
                        </Link>
                      </div>
                    ))}
                  </div>
                </div>
              ))}
            </div>
            {actionButtons.length > 0 && renderActionButtons()}
          </div>{" "}
        </div>
      </nav>
      {isMenuOpen && (
        <div className="bg-background fixed inset-0 z-900 flex flex-col pt-12 lg:hidden">
          <div className="flex h-full flex-col gap-1 overflow-x-hidden overflow-y-auto px-6 py-6">
            <div className="w-full">
              {serviceGroups.map((group, index) => (
                <div key={index} className="">
                  <div className="text-muted-foreground mb-2 px-1 text-xs font-semibold tracking-wider uppercase">
                    {group.title}
                  </div>
                  {group.services.map(({ label, iconHref, href }) => (
                    <div key={label} className="w-full px-1">
                      <Link
                        href={href}
                        onClick={() => setIsMenuOpen(false)}
                        className="flex w-full items-center gap-2 py-2"
                      >
                        {iconHref && <Image src={iconHref} alt={label} width={32} height={32} />}
                        <span className="text-[14px] leading-tight">{label}</span>
                      </Link>
                    </div>
                  ))}
                  {index < serviceGroups.length - 1 && (
                    <div className="border-muted-foreground/20 mx-1 my-2 w-full border-t" />
                  )}
                </div>
              ))}
            </div>

            <div className="border-muted-foreground/20 mx-1 my-2 w-full border-t" />

            <div className="flex flex-col gap-1">
              {commonTranslation.navigation.map(({ title, link }) => (
                <Link key={title} href={link} onClick={() => setIsMenuOpen(false)}>
                  <Button variant="ghost" className="w-full justify-start px-3">
                    {title}
                  </Button>
                </Link>
              ))}
            </div>

            {actionButtons.length > 0 && renderActionButtons("w-full flex-col gap-2 items-stretch")}
          </div>
        </div>
      )}
    </>
  );
}
