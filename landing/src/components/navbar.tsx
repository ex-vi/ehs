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
    href: "https://clienthub.getjobber.com/client_hubs/beb89d28-6376-486e-b031-a0724d28a0a4/login/new?source=share_login",
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
