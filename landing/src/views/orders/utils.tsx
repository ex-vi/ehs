import { memo } from "react";

import { cn } from "@/core/lib/utils";
import { OrderStatus, PaymentStatus } from "@/core/models/orders";

const base = "inline-flex items-center rounded-full px-2.5 py-0.5 text-xs font-medium";

const colors: Record<"grey" | "blue" | "green" | "yellow" | "orange" | "red", string> = {
  grey: "bg-neutral-500 text-background font-semibold",
  blue: "bg-esg-blue text-background font-semibold",
  green: "bg-green-700 text-background font-semibold",
  yellow: "bg-yellow-500 text-background font-semibold",
  orange: "bg-orange-500 text-background font-semibold",
  red: "bg-red-700 text-background font-semibold",
};

const orderStatusMap: Record<OrderStatus, { label: string; color: keyof typeof colors }> = {
  pending: { label: "Ordered", color: "grey" },
  in_progress: { label: "In progress", color: "yellow" },
  done: { label: "Done", color: "blue" },
  cancelled: { label: "Cancelled", color: "red" },
  rescheduled: { label: "Rescheduled", color: "orange" },
};

const paymentStatusMap: Record<PaymentStatus, { label: string; color: keyof typeof colors }> = {
  unpaid: { label: "Unpaid", color: "red" },
  paid: { label: "Paid", color: "green" },
};

export const OrderStatusBadge = memo(function OrderStatusBadge({ status }: { status: OrderStatus }) {
  const { label, color } = orderStatusMap[status];
  return <span className={cn(base, colors[color])}>{label}</span>;
});

export const PaymentStatusBadge = memo(function PaymentStatusBadge({ status }: { status: PaymentStatus }) {
  const { label, color } = paymentStatusMap[status];
  return <span className={cn(base, colors[color])}>{label}</span>;
});
