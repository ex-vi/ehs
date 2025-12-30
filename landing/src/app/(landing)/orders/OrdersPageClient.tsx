"use client";

import { useCallback, useState } from "react";

import { Order } from "@/core/models/orders";
import { fetchOrders } from "@/views/orders/fetchers";
import { OrdersTable } from "@/views/orders/OrdersTable";

interface OrdersPageClientProps {
  initialOrders: Order[];
}

export default function OrdersPageClient({ initialOrders }: OrdersPageClientProps) {
  const [orders, setOrders] = useState<Order[]>(initialOrders);
  const [isLoading, setIsLoading] = useState(false);

  const refreshOrders = useCallback(async () => {
    try {
      setIsLoading(true);
      const ordersData = await fetchOrders();
      setOrders(ordersData.data);
    } catch (error) {
      console.error("Failed to refresh orders:", error);
    } finally {
      setIsLoading(false);
    }
  }, []);

  return (
    <div className="relative">
      {isLoading && (
        <div className="absolute inset-0 z-10 flex items-center justify-center bg-white/50">
          <div className="text-muted-foreground text-sm">Updating...</div>
        </div>
      )}
      <OrdersTable rows={orders} onRefresh={refreshOrders} />
    </div>
  );
}
