import "server-only";

import { NextResponse } from "next/server";

import restClient from "@/core/services/restClient";

export async function GET() {
  try {
    const response = await restClient.get("/orders");
    return NextResponse.json(response.data);
  } catch (error: any) {
    return NextResponse.json({ error: error?.message || "Failed to fetch orders" }, { status: 500 });
  }
}
