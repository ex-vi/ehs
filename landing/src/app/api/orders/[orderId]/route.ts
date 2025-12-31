import "server-only";

import { NextRequest, NextResponse } from "next/server";

import restClient from "@/core/services/restClient";

export async function PUT(request: NextRequest, context: { params: Promise<{ orderId: string }> }) {
  try {
    const { orderId } = await context.params;
    const body = await request.json();

    const response = await restClient.put(`/orders/${orderId}`, body);
    return NextResponse.json(response.data);
  } catch (error: any) {
    return NextResponse.json({ error: error?.message || "Failed to update order" }, { status: 500 });
  }
}
