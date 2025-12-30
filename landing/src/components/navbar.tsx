import { fetchServices } from "@/core/api/services";

import NavbarClient from "./NavbarClient";

export type ActionButton = {
  label: string;
  href: string;
  variant?: "default" | "outline" | "ghost" | "blue" | "secondary";
};

const DEFAULT_ACTION_BUTTONS: readonly ActionButton[] = [
  {
    label: "Login",
    href: "/login",
    variant: "blue",
  },
] as const;

export interface NavbarProps {
  actionButtons?: readonly ActionButton[];
}

export default async function Navbar({ actionButtons = DEFAULT_ACTION_BUTTONS }: NavbarProps) {
  const services = await fetchServices();

  return <NavbarClient services={services ?? []} actionButtons={actionButtons} />;
}
