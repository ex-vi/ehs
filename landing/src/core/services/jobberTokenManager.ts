import "server-only";

import { Pool } from "pg";

import { JobberOAuth, JobberTokens } from "./jobberOAuth";

/**
 * Token storage interface
 * Implement this to store tokens in your preferred storage mechanism
 * (database, Redis, environment variables, etc.)
 */
export interface ITokenStorage {
  getTokens(): Promise<JobberTokens | null>;
  saveTokens(tokens: JobberTokens): Promise<void>;
}

function decodeJwtExp(accessToken: string): number | undefined {
  try {
    const payloadB64Url = accessToken.split(".")[1];
    if (!payloadB64Url) return undefined;

    const payloadB64 = payloadB64Url
      .replace(/-/g, "+")
      .replace(/_/g, "/")
      .padEnd(Math.ceil(payloadB64Url.length / 4) * 4, "=");
    const decoded = JSON.parse(Buffer.from(payloadB64, "base64").toString("utf8")) as { exp?: unknown };
    return typeof decoded.exp === "number" ? decoded.exp : undefined;
  } catch {
    return undefined;
  }
}

declare global {
  // eslint-disable-next-line no-var
  var __jobberPgPool: Pool | undefined;
}

function getPgPool(): Pool {
  if (globalThis.__jobberPgPool) return globalThis.__jobberPgPool;

  const connectionString = process.env.DATABASE_URL;
  if (!connectionString) {
    throw new Error("DATABASE_URL is required for Jobber token storage");
  }

  globalThis.__jobberPgPool = new Pool({ connectionString });
  return globalThis.__jobberPgPool;
}

/**
 * DB-based token storage using Postgres
 * Table: jobber.tokens
 * Columns: id (TEXT), access_token (TEXT), refresh_token (TEXT)
 * Always uses id='main'
 */
export class DbTokenStorage implements ITokenStorage {
  private static readonly TOKEN_ID = "main";

  async getTokens(): Promise<JobberTokens | null> {
    const pool = getPgPool();

    const result = await pool.query<{ access_token: string | null; refresh_token: string | null }>(
      "SELECT access_token, refresh_token FROM jobber.tokens WHERE id = $1 LIMIT 1",
      [DbTokenStorage.TOKEN_ID]
    );

    const row = result.rows[0];
    if (!row?.access_token || !row?.refresh_token) return null;

    return {
      access_token: row.access_token,
      refresh_token: row.refresh_token,
      expires_at: decodeJwtExp(row.access_token),
    };
  }

  async saveTokens(tokens: JobberTokens): Promise<void> {
    const pool = getPgPool();

    const updateResult = await pool.query(
      "UPDATE jobber.tokens SET access_token = $1, refresh_token = $2 WHERE id = $3",
      [tokens.access_token, tokens.refresh_token, DbTokenStorage.TOKEN_ID]
    );

    if (updateResult.rowCount && updateResult.rowCount > 0) return;

    await pool.query("INSERT INTO jobber.tokens (id, access_token, refresh_token) VALUES ($1, $2, $3)", [
      DbTokenStorage.TOKEN_ID,
      tokens.access_token,
      tokens.refresh_token,
    ]);
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

    // Check if token is expired or about to expire
    if (JobberOAuth.isTokenExpired(tokens.expires_at)) {
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

// Default token manager instance using DB storage
const tokenStorage = new DbTokenStorage();

export const jobberTokenManager = new JobberTokenManager(tokenStorage);
