import { JobberOAuth, JobberTokens } from "./jobberOAuth";
import restClient from "./restClient";

/**
 * Token storage interface
 * Implement this to store tokens in your preferred storage mechanism
 * (database, Redis, environment variables, etc.)
 */
export interface ITokenStorage {
  getTokens(): Promise<JobberTokens | null>;
  saveTokens(tokens: JobberTokens): Promise<void>;
}

/**
 * API-based token storage using restClient
 * Stores tokens remotely via REST API (server-side only)
 */
export class ApiTokenStorage implements ITokenStorage {
  async getTokens(): Promise<JobberTokens | null> {
    try {
      const response = await restClient.get<{
        access_token: string;
        refresh_token: string;
      }>("/tokens");

      console.warn("Fetched tokens from API:", response.data);

      if (!response.data.access_token || !response.data.refresh_token) {
        return null;
      }

      return {
        access_token: response.data.access_token,
        refresh_token: response.data.refresh_token,
      };
    } catch (error: any) {
      // If 404 or other error, no tokens exist
      console.warn("Failed to fetch tokens from API:", error.message);
      return null;
    }
  }

  async saveTokens(tokens: JobberTokens): Promise<void> {
    try {
      await restClient.post("/tokens", {
        access_token: tokens.access_token,
        refresh_token: tokens.refresh_token,
      });
    } catch (error: any) {
      console.error("Failed to save tokens to API:", error.message);
      throw new Error("Failed to save tokens");
    }
  }
}

/**
 * Jobber token manager
 * Handles token retrieval, refresh, and storage
 */
export class JobberTokenManager {
  private storage: ITokenStorage;

  constructor(storage: ITokenStorage) {
    this.storage = storage;
  }

  /**
   * Get a valid access token, refreshing if necessary
   */
  async getValidAccessToken(): Promise<string> {
    const tokens = await this.storage.getTokens();

    if (!tokens) {
      throw new Error("No Jobber tokens found. Please complete the OAuth authorization flow first.");
    }

    console.warn("Current tokens:", tokens);

    // Check if token is expired or about to expire
    if (JobberOAuth.isTokenExpired(tokens.expires_at)) {
      console.warn("Access token expired, refreshing...");
      const newTokens = await JobberOAuth.refreshAccessToken(tokens.refresh_token);
      await this.storage.saveTokens(newTokens);
      return newTokens.access_token;
    }

    return tokens.access_token;
  }

  /**
   * Store tokens after OAuth authorization
   */
  async storeTokens(tokens: JobberTokens): Promise<void> {
    await this.storage.saveTokens(tokens);
  }
}

// Default token manager instance using API storage
const tokenStorage = new ApiTokenStorage();

export const jobberTokenManager = new JobberTokenManager(tokenStorage);
