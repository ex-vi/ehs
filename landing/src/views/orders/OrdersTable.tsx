"use client";

import dayjs from "dayjs";
import { Frown, Meh, MoreVertical, Smile } from "lucide-react";
import { memo, useState } from "react";

import { cn } from "@/core/lib/utils";
import { FeedbackType, Order } from "@/core/models/orders";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { updateOrderFeedback } from "@/views/orders/fetchers";

import { OrderStatusBadge, PaymentStatusBadge } from "./utils";

const feedbackBackground = {
  good: "bg-green-700",
  average: "bg-yellow-500",
  bad: "bg-red-700",
};

const FeedbackDisplay = memo(function FeedbackDisplay({
  enabled,
  orderId,
  selectedFeedback,
  onFeedbackChange,
}: {
  enabled: boolean;
  orderId: string;
  selectedFeedback: FeedbackType;
  onFeedbackChange: (orderId: string, feedback: FeedbackType) => void;
}) {
  const [showOptions, setShowOptions] = useState(false);

  if (!enabled) return null;

  if (selectedFeedback) {
    const feedbackIcon = {
      good: <Smile size={14} className="text-background" />,
      average: <Meh size={14} className="text-background" />,
      bad: <Frown size={14} className="text-background" />,
    }[selectedFeedback];

    return (
      <Button
        variant="outline"
        size="icon"
        className={cn(
          `grid h-9 w-8 cursor-default place-items-center rounded-md text-[13px] shadow-sm transition-all duration-200 hover:${feedbackBackground[selectedFeedback]}`,
          feedbackBackground[selectedFeedback]
        )}
      >
        {feedbackIcon}
      </Button>
    );
  }

  if (showOptions) {
    return (
      <FeedbackPills
        enabled={true}
        orderId={orderId}
        selectedFeedback={selectedFeedback}
        onFeedbackChange={(id, feedback) => {
          onFeedbackChange(id, feedback);
          setShowOptions(false);
        }}
      />
    );
  }

  return (
    <div className="flex items-center gap-1">
      <Button
        variant="outline"
        size="icon"
        onClick={() => setShowOptions(true)}
        className="grid h-9 w-8 cursor-pointer place-items-center rounded-md bg-gray-300 text-[13px] text-gray-600 shadow-sm transition-all duration-200 hover:scale-105"
        title="Rate your experience"
      >
        <Smile size={14} />
      </Button>
    </div>
  );
});

const FeedbackPills = memo(function FeedbackPills({
  enabled,
  orderId,
  selectedFeedback,
  onFeedbackChange,
}: {
  enabled: boolean;
  orderId: string;
  selectedFeedback: FeedbackType;
  onFeedbackChange: (orderId: string, feedback: FeedbackType) => void;
}) {
  if (!enabled) return null;

  const handleFeedbackClick = (type: FeedbackType) => {
    const newFeedback = selectedFeedback === type ? null : type;
    onFeedbackChange(orderId, newFeedback);
  };

  const baseClasses =
    "h-9 w-8 grid place-items-center rounded-md text-[13px] shadow-sm cursor-pointer transition-all duration-200 hover:scale-105";

  return (
    <div className="flex items-center gap-1">
      <Button
        variant="outline"
        size="icon"
        onClick={() => handleFeedbackClick("good")}
        className={cn(
          baseClasses,
          selectedFeedback === "good"
            ? "text-background hover:text-background bg-green-700 hover:bg-green-700"
            : "hover:text-background bg-gray-100 hover:bg-green-700"
        )}
        title="Good"
      >
        <Smile size={14} />
      </Button>
      <Button
        variant="outline"
        size="icon"
        onClick={() => handleFeedbackClick("average")}
        className={cn(
          baseClasses,
          selectedFeedback === "average"
            ? "text-background hover:text-background bg-yellow-500 hover:bg-yellow-500"
            : "hover:text-background bg-gray-100 hover:bg-yellow-500"
        )}
        title="Average"
      >
        <Meh size={14} />
      </Button>
      <Button
        variant="outline"
        size="icon"
        onClick={() => handleFeedbackClick("bad")}
        className={cn(
          baseClasses,
          selectedFeedback === "bad"
            ? "text-background hover:text-background bg-red-700 hover:bg-red-700"
            : "hover:text-background bg-gray-100 hover:bg-red-700"
        )}
        title="Bad"
      >
        <Frown size={14} />
      </Button>
    </div>
  );
});

const methodLabels: Record<Order["meta"]["payment"]["method"], string> = {
  online: "Credit Card",
  cash: "Cash",
  invoice: "Invoice",
};

const generateReorderUrl = (order: Order): string => {
  const params = new URLSearchParams();

  if (order.meta.address.street) params.set("street", order.meta.address.street);
  if (order.meta.address.unit) params.set("unit", order.meta.address.unit);
  if (order.meta.address.city) params.set("city", order.meta.address.city);
  if (order.meta.address.province) params.set("province", order.meta.address.province);
  if (order.meta.address.entry_instructions) params.set("entry_instructions", order.meta.address.entry_instructions);

  if (order.meta.contacts.first_name) params.set("first_name", order.meta.contacts.first_name);
  if (order.meta.contacts.last_name) params.set("last_name", order.meta.contacts.last_name);
  if (order.meta.contacts.email) params.set("email", order.meta.contacts.email);
  if (order.meta.contacts.phone) params.set("phone", order.meta.contacts.phone);
  if (order.meta.other_instructions) params.set("other_instructions", order.meta.other_instructions);

  const paymentMethodMap: Record<string, string> = {
    cash: "Cash or card on site",
    online: "Credit or debit card (online, immediate payment) ",
    invoice: "Invoice",
  };
  const paymentMethod = paymentMethodMap[order.meta.payment.method] || "Cash or card on site";
  params.set("payment_method", paymentMethod);

  if (order.meta.payment.method === "invoice" && order.meta.vat_info) {
    if (order.meta.vat_info.company_name) params.set("company_name", order.meta.vat_info.company_name);
    if (order.meta.vat_info.vat_number) params.set("vat_number", order.meta.vat_info.vat_number);
    if (order.meta.vat_info.billing_address) params.set("billing_address", order.meta.vat_info.billing_address);
    if (order.meta.vat_info.invoice_email) params.set("invoice_email", order.meta.vat_info.invoice_email);
    if (order.meta.vat_info.contact_person) params.set("contact_person", order.meta.vat_info.contact_person);
    if (order.meta.vat_info.phone_number) params.set("phone_number", order.meta.vat_info.phone_number);
  }

  return `/orders/create?${params.toString()}`;
};

const OrderTableRow = memo(function OrderTableRow({
  order,
  index,
  selectedFeedback,
  onFeedbackChange,
}: {
  order: Order;
  index: number;
  selectedFeedback: FeedbackType;
  onFeedbackChange: (orderId: string, feedback: FeedbackType) => void;
}) {
  const isDone = order.meta.status === "done";
  const methodLabel = methodLabels[order.meta.payment.method];
  const addressText = `${order.meta.address.street}${order.meta.address.unit ? `, ${order.meta.address.unit}` : ""}, ${order.meta.address.city}`;

  const formattedAmount = `${order.meta.total.toFixed(2)}`;
  return (
    <TableRow key={order.id}>
      <TableCell height={53} className="font-medium">
        {dayjs(order.created_at).format("DD.MM.YYYY HH:mm")}
      </TableCell>
      <TableCell className="font-medium">{dayjs(order.datetime).format("DD.MM.YYYY HH:mm")}</TableCell>
      <TableCell className="font-medium whitespace-nowrap">{addressText}</TableCell>
      <TableCell>
        <OrderStatusBadge status={order.meta.status} />
      </TableCell>
      <TableCell width={120}>
        <FeedbackDisplay
          enabled={isDone}
          orderId={order.id}
          selectedFeedback={selectedFeedback}
          onFeedbackChange={onFeedbackChange}
        />
      </TableCell>
      <TableCell>
        <div className="flex items-center gap-1">
          <PaymentStatusBadge status={order.meta.payment.status} />
          <p>{methodLabel}</p>
        </div>
      </TableCell>
      <TableCell className="text-right font-medium">$ {formattedAmount}</TableCell>
      <TableCell className="text-right">
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button variant="outline" className="h-8 w-8 rounded-md p-0">
              <span className="sr-only">Open menu</span>
              <MoreVertical className="iconSize" />
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end">
            <DropdownMenuItem onClick={() => (window.location.href = generateReorderUrl(order))}>
              <span>Re-order</span>
            </DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </TableCell>
    </TableRow>
  );
});

export const OrdersTable = memo(function OrdersTable({ rows, onRefresh }: { rows: Order[]; onRefresh?: () => void }) {
  const [localFeedback, setLocalFeedback] = useState<Record<string, FeedbackType>>({});

  const handleFeedbackChange = async (orderId: string, feedback: FeedbackType) => {
    const order = rows.find((o) => o.id === orderId);
    if (!order) return;

    try {
      setLocalFeedback((prev) => ({ ...prev, [orderId]: feedback }));

      await updateOrderFeedback(orderId, { ...order, meta: { ...order.meta, feedback } });

      onRefresh?.();
    } catch (error) {
      setLocalFeedback((prev) => {
        const newState = { ...prev };
        delete newState[orderId];
        return newState;
      });
      console.error("Failed to update feedback:", error);
    }
  };

  const getFeedback = (orderId: string): FeedbackType => {
    const order = rows.find((o) => o.id === orderId);
    return localFeedback[orderId] ?? order?.meta.feedback ?? null;
  };

  return (
    <div className="rounded-lg border">
      <Table>
        <TableHeader>
          <TableRow>
            <TableHead>Created</TableHead>
            <TableHead>Cleaning date</TableHead>
            <TableHead>Address</TableHead>
            <TableHead>Status</TableHead>
            <TableHead>Feedback</TableHead>
            <TableHead>Payment</TableHead>
            <TableHead className="text-right">Total</TableHead>
            <TableHead className="w-8" />
          </TableRow>
        </TableHeader>

        <TableBody>
          {rows.map((order, index) => (
            <OrderTableRow
              key={order.id}
              order={order}
              index={index}
              selectedFeedback={getFeedback(order.id)}
              onFeedbackChange={handleFeedbackChange}
            />
          ))}
        </TableBody>
      </Table>
    </div>
  );
});
