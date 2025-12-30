import axios from "axios";

import { JOBBER_CLIENT_ID, JOBBER_CLIENT_SECRET } from "../constants/common";

export interface JobberTokens {
  access_token: string;
  refresh_token: string;
  expires_at?: number; // Unix timestamp when token expires
}

/**
 * OAuth 2.0 utilities for Jobber API
 * Jobber uses Authorization Code flow, NOT client credentials
 */
export class JobberOAuth {
  private static readonly OAUTH_BASE_URL = "https://api.getjobber.com/api/oauth";
  private static readonly TOKEN_ENDPOINT = `${JobberOAuth.OAUTH_BASE_URL}/token`;

  /**
   * Generate the authorization URL to redirect users to Jobber's OAuth consent screen
   * @param redirectUri - Your application's callback URL (must match what's configured in Jobber Developer Center)
   * @param state - Random string for CSRF protection (optional but recommended)
   */
  static getAuthorizationUrl(redirectUri: string, state?: string): string {
    const params = new URLSearchParams({
      response_type: "code",
      client_id: JOBBER_CLIENT_ID || "",
      redirect_uri: redirectUri,
    });

    if (state) {
      params.append("state", state);
    }

    return `${this.OAUTH_BASE_URL}/authorize?${params.toString()}`;
  }

  /**
   * Exchange authorization code for access token and refresh token
   * @param code - Authorization code received from OAuth callback
   * @param redirectUri - Same redirect URI used in authorization request
   */
  static async exchangeCodeForTokens(code: string, redirectUri: string): Promise<JobberTokens> {
    try {
      const response = await axios.post(
        this.TOKEN_ENDPOINT,
        new URLSearchParams({
          client_id: JOBBER_CLIENT_ID || "",
          client_secret: JOBBER_CLIENT_SECRET || "",
          grant_type: "authorization_code",
          code,
          redirect_uri: redirectUri,
        }).toString(),
        {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        }
      );

      const { access_token, refresh_token } = response.data;

      // Decode JWT to get expiry (Jobber tokens are JWTs)
      const expires_at = this.getTokenExpiry(access_token);

      return {
        access_token,
        refresh_token,
        expires_at,
      };
    } catch (error: any) {
      console.error("Failed to exchange authorization code:", error.response?.data || error);
      throw new Error("Failed to exchange authorization code for tokens");
    }
  }

  /**
   * Refresh an expired access token using the refresh token
   * @param refreshToken - The refresh token from the initial authorization
   */
  static async refreshAccessToken(refreshToken: string): Promise<JobberTokens> {
    try {
      const response = await axios.post(
        this.TOKEN_ENDPOINT,
        new URLSearchParams({
          client_id: JOBBER_CLIENT_ID || "",
          client_secret: JOBBER_CLIENT_SECRET || "",
          grant_type: "refresh_token",
          refresh_token: refreshToken,
        }).toString(),
        {
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
        }
      );

      const { access_token, refresh_token: new_refresh_token } = response.data;

      // Decode JWT to get expiry
      const expires_at = this.getTokenExpiry(access_token);

      return {
        access_token,
        refresh_token: new_refresh_token,
        expires_at,
      };
    } catch (error: any) {
      console.error("Failed to refresh access token:", error.response?.data || error);
      throw new Error("Failed to refresh access token");
    }
  }

  /**
   * Check if a token is expired or about to expire
   * @param expiresAt - Unix timestamp when token expires
   * @param bufferMinutes - Minutes before expiry to consider token expired (default: 5)
   */
  static isTokenExpired(expiresAt?: number, bufferMinutes = 5): boolean {
    if (!expiresAt) return true;

    const now = Math.floor(Date.now() / 1000);
    const buffer = bufferMinutes * 60;

    return expiresAt - buffer < now;
  }

  /**
   * Decode JWT access token to extract expiry time
   * Note: This doesn't verify the signature, just extracts the payload
   */
  private static getTokenExpiry(accessToken: string): number {
    try {
      const payload = accessToken.split(".")[1];
      const decoded = JSON.parse(Buffer.from(payload, "base64").toString());
      return decoded.exp; // Unix timestamp
    } catch (error) {
      console.error("Failed to decode JWT token:", error);
      // Default to 60 minutes from now if we can't decode
      return Math.floor(Date.now() / 1000) + 3600;
    }
  }

  /**
   * Query Jobber account information using an access token
   * Useful for verifying tokens and getting account details
   */
  static async getAccountInfo(accessToken: string): Promise<{
    id: string;
    name: string;
  }> {
    try {
      const response = await axios.post(
        "https://api.getjobber.com/api/graphql",
        {
          query: `
            query {
              account {
                id
                name
              }
            }
          `,
        },
        {
          headers: {
            Authorization: `Bearer ${accessToken}`,
            "Content-Type": "application/json",
            "X-JOBBER-GRAPHQL-VERSION": "2025-04-16",
          },
        }
      );

      if (response.data.errors) {
        throw new Error(response.data.errors[0]?.message || "Failed to fetch account info");
      }

      return response.data.data.account;
    } catch (error: any) {
      console.error("Failed to get account info:", error.response?.data || error);
      throw new Error("Failed to get account info");
    }
  }
}
