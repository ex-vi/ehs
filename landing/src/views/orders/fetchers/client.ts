import { PaginatedDataResponse } from "@/core/models/common";
import { Order } from "@/core/models/orders";

export async function fetchOrders(): Promise<PaginatedDataResponse<Order[]>> {
  const response = await fetch("/api/orders", { method: "GET" });
  if (!response.ok) {
    throw new Error((await response.text()) || "Failed to fetch orders");
  }
  return response.json();
}

export async function updateOrderFeedback(orderId: string, orderData: Order): Promise<Order> {
  const response = await fetch(`/api/orders/${encodeURIComponent(orderId)}`, {
    method: "PUT",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(orderData),
  });

  if (!response.ok) {
    throw new Error((await response.text()) || "Failed to update feedback");
  }

  return response.json();
}
