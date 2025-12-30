import Link from "next/link";

import OrdersPageClient from "@/app/(landing)/orders/OrdersPageClient";
import { ordersTranslation } from "@/core/translations/orders";
import { Button } from "@/components/ui/button";
import { fetchOrders } from "@/views/orders/fetchers";

export const dynamic = "force-dynamic";

export default async function Orders() {
  const ordersData = await fetchOrders();

  return (
    <div className="section-padding-y">
      <div className="border-border bg-background pt-4 md:pt-6">
        <div className="container mx-auto flex flex-col gap-6 px-4 lg:px-6">
          <div className="flex flex-col justify-between gap-6 md:flex-row md:items-center">
            <div className="space-y-2 md:w-3/5">
              <h1 className="text-2xl font-bold tracking-tight md:text-3xl">{ordersTranslation.title}</h1>
              <p className="text-muted-foreground text-sm lg:text-base">{ordersTranslation.description}</p>
            </div>
            <div className="flex flex-row-reverse justify-end gap-2 md:flex-row">
              <Link href={"/orders/create"}>
                <Button variant="blue" className="hidden lg:inline-flex">
                  {ordersTranslation.create}
                </Button>
              </Link>
            </div>
          </div>
          <OrdersPageClient initialOrders={ordersData.data} />
        </div>
      </div>
    </div>
  );
}
