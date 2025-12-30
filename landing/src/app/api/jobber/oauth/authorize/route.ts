import { NextRequest, NextResponse } from "next/server";

import { JobberOAuth } from "@/core/services/jobberOAuth";

/**
 * OAuth Authorization endpoint
 * Redirects user to Jobber's OAuth consent screen
 *
 * Usage: Navigate to /api/jobber/oauth/authorize
 */
export async function GET(request: NextRequest) {
  try {
    // Get the base URL for redirect
    const protocol = request.headers.get("x-forwarded-proto") || "http";
    const host = request.headers.get("host");
    const redirectUri = `${protocol}://${host}/api/jobber/oauth/callback`;

    // Generate a state token for CSRF protection (you should store this in session)
    const state = Math.random().toString(36).substring(7);

    // In a real app, you'd store the state in a session/cookie to verify later
    // For now, we'll skip state validation (not recommended for production)

    const authUrl = JobberOAuth.getAuthorizationUrl(redirectUri, state);

    // Redirect to Jobber's authorization page
    return NextResponse.redirect(authUrl);
  } catch (error: any) {
    console.error("OAuth authorization error:", error);
    return NextResponse.json({ error: "Failed to initiate OAuth flow" }, { status: 500 });
  }
}
