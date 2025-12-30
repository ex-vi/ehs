import { NextRequest, NextResponse } from "next/server";

import { JobberOAuth } from "@/core/services/jobberOAuth";
import { jobberTokenManager } from "@/core/services/jobberTokenManager";

/**
 * OAuth Callback endpoint
 * Jobber redirects here after user authorizes the app
 *
 * URL: /api/jobber/oauth/callback?code=AUTHORIZATION_CODE&state=STATE
 */
export async function GET(request: NextRequest) {
  try {
    const searchParams = request.nextUrl.searchParams;
    const code = searchParams.get("code");

    // If no code, user likely denied access
    if (!code) {
      return NextResponse.json({ error: "Authorization denied or cancelled by user" }, { status: 400 });
    }

    // In production, verify the state parameter matches what you sent
    // to prevent CSRF attacks

    // Get the redirect URI (must match what was used in authorize step)
    const protocol = request.headers.get("x-forwarded-proto") || "http";
    const host = request.headers.get("host");
    const redirectUri = `${protocol}://${host}/api/jobber/oauth/callback`;

    // Exchange authorization code for tokens
    const tokens = await JobberOAuth.exchangeCodeForTokens(code, redirectUri);

    console.warn("Obtained Jobber tokens:", tokens);

    // Store tokens
    await jobberTokenManager.storeTokens(tokens);

    // Get account info to verify the connection
    const accountInfo = await JobberOAuth.getAccountInfo(tokens.access_token);

    console.warn(`Successfully connected to Jobber account: ${accountInfo.name} (${accountInfo.id})`);

    // Redirect to a success page or return JSON
    return NextResponse.json({
      success: true,
      message: "Successfully connected to Jobber",
      account: accountInfo,
    });
  } catch (error: any) {
    console.error("OAuth callback error:", error);
    return NextResponse.json({ error: error.message || "Failed to complete OAuth flow" }, { status: 500 });
  }
}
