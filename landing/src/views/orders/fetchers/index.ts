import "server-only";

import { CreateOrderRequest } from "@/core/forms/orders/create";
import { PaginatedDataResponse } from "@/core/models/common";
import { Order } from "@/core/models/orders";
import { createJobberOrder } from "@/core/services/jobberService";
import restClient from "@/core/services/restClient";

export async function fetchOrders(): Promise<PaginatedDataResponse<Order[]>> {
  try {
    const response = await restClient.get(`/orders`);
    return response.data;
  } catch (error) {
    console.error("Error fetching orders:", error);
    throw error;
  }
}

export async function createOrder(
  body: CreateOrderRequest
): Promise<{ success: boolean; data?: Order; error?: string; fieldErrors?: Record<string, string> }> {
  try {
    // First, create the order in Jobber
    const jobberResult = await createJobberOrder(body);

    if (!jobberResult.success) {
      return {
        success: false,
        error: jobberResult.error || "Failed to create order in Jobber",
      };
    }

    // Then, create it in our backend with Jobber reference
    // const response = await restClient.post(`/orders`, {
    //   ...body,
    //   meta: {
    //     ...body.meta,
    //     jobber_job_id: jobberResult.jobId,
    //     jobber_job_number: jobberResult.jobNumber,
    //   },
    // });

    return { success: true, data: undefined };
  } catch (error: any) {
    console.error("Error creating order:", error);
    return {
      success: false,
      error: error?.message || "Failed to create order",
      fieldErrors: error?.fieldErrors,
    };
  }
}

export async function updateOrderFeedback(orderId: string, orderData: Order): Promise<Order> {
  try {
    const response = await restClient.put(`/orders/${orderId}`, orderData);
    return response.data;
  } catch (error) {
    console.error("Error updating order feedback:", error);
    throw error;
  }
}

export async function fetchOrderById(orderId: string): Promise<Order> {
  try {
    const response = await restClient.get(`/orders/${orderId}`);
    return response.data;
  } catch (error) {
    console.error("Error fetching order:", error);
    throw error;
  }
}
