import { redirect } from "next/navigation";

import { CreateOrderRequest } from "@/core/forms/orders/create";
import { getOrderFormData } from "@/views/orders/create/utils/calculations";
import { submitOrderFromFormik } from "@/views/orders/create/utils/formik-bridge";
import CreateOrderPage from "@/views/orders/create/utils/index";

interface CreateOrderPageProps {
  searchParams: Promise<Record<string, string>>;
}

export default async function CreateOrder({ searchParams }: CreateOrderPageProps) {
  const resolvedSearchParams = await searchParams;

  const orderFormData = await getOrderFormData();

  const handleOrderSubmit = async (requestData: CreateOrderRequest) => {
    "use server";

    const result = await submitOrderFromFormik(requestData);

    if (result.success) {
      redirect("/orders/success");
    }

    const errorMessage = Array.isArray(result.errors) ? result.errors.join(", ") : "Failed to create order";

    throw new Error(errorMessage);
  };

  return (
    <CreateOrderPage searchParams={resolvedSearchParams} orderFormData={orderFormData} onSubmit={handleOrderSubmit} />
  );
}
