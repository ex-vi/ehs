# Jobber OAuth Setup - Quick Start

## TL;DR

Jobber **does NOT support** client credentials flow. You MUST use OAuth 2.0 Authorization Code flow.

## Setup Steps

### 1. Configure Jobber App

- Go to https://developer.getjobber.com
- Create or edit your app
- Set callback URL to: `https://yourdomain.com/api/jobber/oauth/callback`
- Copy Client ID and Client Secret

### 2. Add to `.env.local`

```bash
JOBBER_CLIENT_ID=your_client_id
JOBBER_CLIENT_SECRET=your_client_secret
```

### 3. Authorize the App

Visit: `http://localhost:3000/api/jobber/oauth/authorize`

This will:

- Redirect you to Jobber
- Ask you to authorize the app
- Redirect back with tokens
- Store tokens automatically

### 4. Verify Connection

Check: `http://localhost:3000/api/jobber/oauth/status`

Should return:

```json
{ "connected": true, "message": "Jobber OAuth is connected" }
```

## Production Setup

For production, after completing OAuth once:

1. Get tokens from the callback response
2. Add to production environment:

```bash
JOBBER_ACCESS_TOKEN=eyJ0eXAi...
JOBBER_REFRESH_TOKEN=5dd9bed1bd99...
```

Tokens will auto-refresh. New refresh tokens will be logged to console.

## Troubleshooting

### "No Jobber tokens found"

- You need to complete OAuth authorization first
- Visit `/api/jobber/oauth/authorize`

### Tokens lost after restart (dev)

- Normal in development (in-memory storage)
- Re-authorize via `/api/jobber/oauth/authorize`

### "Failed to refresh access token"

- Refresh token expired or invalid
- Re-authorize via `/api/jobber/oauth/authorize`

## Implementation Details

See [JOBBER_INTEGRATION.md](./JOBBER_INTEGRATION.md) for full documentation.

### Key Changes Made:

- ❌ Removed client credentials flow (not supported by Jobber)
- ✅ Implemented OAuth 2.0 Authorization Code flow
- ✅ Added token storage and refresh logic
- ✅ Created OAuth API endpoints
- ✅ Auto-refresh before token expiry
