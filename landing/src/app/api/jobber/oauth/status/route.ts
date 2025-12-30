import { NextResponse } from "next/server";

import { jobberTokenManager } from "@/core/services/jobberTokenManager";

/**
 * Check Jobber OAuth connection status
 *
 * GET /api/jobber/oauth/status
 */
export async function GET() {
  try {
    await jobberTokenManager.getValidAccessToken();

    return NextResponse.json({
      connected: true,
      message: "Jobber OAuth is connected",
    });
  } catch (error: any) {
    return NextResponse.json(
      {
        connected: false,
        message: error.message || "Not connected to Jobber",
      },
      { status: 401 }
    );
  }
}
