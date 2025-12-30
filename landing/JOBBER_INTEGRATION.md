# Jobber API Integration

This document explains how the Jobber API integration works and how to set it up.

## Overview

The ESG Landing application integrates with Jobber's GraphQL API to automatically create jobs when customers submit orders through the landing page. This integration:

- Creates or finds existing clients in Jobber
- Creates properties (addresses) for clients
- Creates jobs with line items based on the order details
- Uses OAuth 2.0 Authorization Code flow for authentication

## Setup

### 1. Create Jobber App

1. Go to [Jobber Developer Center](https://developer.getjobber.com)
2. Create a new app
3. Configure your app:
   - Set the **Callback URL** to: `https://yourdomain.com/api/jobber/oauth/callback`
   - Select the required scopes (at minimum: clients, properties, jobs)
4. Note down your **Client ID** and **Client Secret**

### 2. Configure Environment Variables

Add the following environment variables to your `.env` file:

```bash
# Required: OAuth credentials from Jobber Developer Center
JOBBER_CLIENT_ID=your_client_id_here
JOBBER_CLIENT_SECRET=your_client_secret_here

# Optional: Defaults to Jobber's production API
JOBBER_API_URL=https://api.getjobber.com/api/graphql

# For production: Store your OAuth tokens (generated after authorization)
JOBBER_ACCESS_TOKEN=your_access_token_here
JOBBER_REFRESH_TOKEN=your_refresh_token_here
```

### 3. Complete OAuth Authorization

#### Option A: Via Web Browser (Recommended for Initial Setup)

1. Start your application
2. Navigate to: `http://localhost:3000/api/jobber/oauth/authorize`
3. You'll be redirected to Jobber's authorization page
4. Log in with your Jobber admin account
5. Click "Allow Access" to authorize the app
6. You'll be redirected back to your callback URL with tokens
7. Tokens are automatically stored

#### Option B: Via Environment Variables (Production)

If you're deploying to production and need persistent tokens:

1. Complete the OAuth flow once (using Option A)
2. Copy the access_token and refresh_token from the callback response
3. Add them to your production environment variables
4. The app will automatically use and refresh these tokens

## How It Works

### OAuth 2.0 Authorization Code Flow

The integration uses the proper OAuth 2.0 Authorization Code flow (NOT client credentials):

1. **User Authorization**: Admin user clicks authorize and grants permissions
2. **Code Exchange**: App exchanges authorization code for access & refresh tokens
3. **Token Storage**: Tokens are stored (in-memory for dev, env vars for prod)
4. **Automatic Refresh**: Access tokens are automatically refreshed when expired
5. **API Requests**: All GraphQL requests use the valid access token

**Important**: Jobber does NOT support client credentials flow. You must complete the OAuth authorization flow to get tokens.

### Order Creation Flow

When a customer submits an order:

1. **Client Creation/Lookup**
   - The system searches for an existing client by email
   - If found, uses that client ID
   - If not found, creates a new client with the provided contact information

2. **Property Creation** (if address is provided)
   - Creates a property record in Jobber with the service address
   - Links it to the client

3. **Job Creation**
   - Creates a job in Jobber with:
     - Job title (e.g., "Standard Cleaning - John Doe")
     - Detailed description including property type, rooms, frequency, etc.
     - Line items for the main service and add-ons
     - Scheduled start time
     - Client and property associations

4. **Backend Recording**
   - After successful Jobber creation, saves the order to the local backend
   - Includes Jobber job ID and job number for reference

## Architecture

### Key Files

- **`src/core/services/jobberClient.ts`**: Core GraphQL client (accepts access tokens)
- **`src/core/services/jobberOAuth.ts`**: OAuth 2.0 utilities and token operations
- **`src/core/services/jobberTokenManager.ts`**: Token storage and refresh logic
- **`src/core/services/jobberService.ts`**: Business logic for creating orders in Jobber
- **`src/app/api/jobber/oauth/authorize/route.ts`**: OAuth authorization endpoint
- **`src/app/api/jobber/oauth/callback/route.ts`**: OAuth callback handler
- **`src/app/api/jobber/oauth/status/route.ts`**: Check connection status
- **`src/app/api/jobber/oauth/disconnect/route.ts`**: Disconnect/clear tokens
- **`src/views/orders/fetchers/index.ts`**: Integration point with order creation flow
- **`src/core/constants/common.ts`**: Environment variable configuration

### GraphQL Operations

The integration uses the following Jobber GraphQL operations:

1. **Search Clients**: Find existing clients by email
2. **Create Client**: Create new clients with contact information
3. **Create Property**: Create property records with addresses
4. **Create Job**: Create jobs with line items and scheduling

## API Endpoints

The following endpoints are available for OAuth management:

### `GET /api/jobber/oauth/authorize`

Initiates the OAuth flow by redirecting to Jobber's authorization page.

### `GET /api/jobber/oauth/callback`

Callback endpoint that receives the authorization code and exchanges it for tokens.

**Query Parameters:**

- `code` - Authorization code from Jobber
- `state` - CSRF protection token (optional)

**Response:**

```json
{
  "success": true,
  "message": "Successfully connected to Jobber",
  "account": {
    "id": "account_id",
    "name": "Account Name"
  }
}
```

### `GET /api/jobber/oauth/status`

Check if the app is currently connected to Jobber.

**Response (Connected):**

```json
{
  "connected": true,
  "message": "Jobber OAuth is connected"
}
```

**Response (Not Connected):**

```json
{
  "connected": false,
  "message": "Not connected to Jobber"
}
```

### `POST /api/jobber/oauth/disconnect`

Clear stored tokens and disconnect from Jobber.

**Response:**

```json
{
  "success": true,
  "message": "Successfully disconnected from Jobber"
}
```

## Token Storage

### Development

In development mode, tokens are stored in-memory. This means:

- ✅ Easy to test and develop
- ❌ Tokens are lost when the server restarts
- You'll need to re-authorize after each restart

### Production

In production mode, tokens are read from environment variables:

- Set `JOBBER_ACCESS_TOKEN` and `JOBBER_REFRESH_TOKEN`
- Tokens persist across deployments
- The app will automatically refresh tokens and log the new values
- You'll need to manually update environment variables when tokens are refreshed

### Custom Storage (Recommended)

For a production-ready solution, implement a custom token storage:

```typescript
import { ITokenStorage, JobberTokens } from "@/core/services/jobberTokenManager";

class DatabaseTokenStorage implements ITokenStorage {
  async getTokens(): Promise<JobberTokens | null> {
    // Fetch from your database
  }

  async saveTokens(tokens: JobberTokens): Promise<void> {
    // Save to your database
  }

  async clearTokens(): Promise<void> {
    // Delete from your database
  }
}

// Update in jobberTokenManager.ts:
const tokenStorage = new DatabaseTokenStorage();
```

## Error Handling

The integration includes comprehensive error handling:

- **Authentication Errors**: Token issues throw clear error messages
- **Token Expiry**: Automatically refreshes tokens before they expire
- **Refresh Token Errors**: If refresh fails, requires re-authorization
- **Client Creation Errors**: Returned with error message
- **Property Creation Errors**: Returned with error message
- **Job Creation Errors**: Returned with error message
- **Validation Errors**: GraphQL user errors are extracted and returned

When any step fails:

- The error is logged to the console
- The process stops
- A descriptive error is returned
- An error response is returned with the failure reason
- The order is not created in the local backend

## Testing

Unit tests are provided in `src/core/services/jobberService.test.ts` covering:

- Successful order creation
- Client creation errors
- Property creation errors
- Job creation errors
- Orders without complete addresses

Run tests with:

```bash
npm test
```

## Data Mapping

### Order to Jobber Job

| Order Field                | Jobber Field          | Notes           |
| -------------------------- | --------------------- | --------------- |
| `meta.contacts.first_name` | Client firstName      |                 |
| `meta.contacts.last_name`  | Client lastName       |                 |
| `meta.contacts.email`      | Client email          | Used for lookup |
| `meta.contacts.phone`      | Client phone          | Optional        |
| `meta.address.street`      | Property street1      |                 |
| `meta.address.unit`        | Property street2      | Optional        |
| `meta.address.city`        | Property city         |                 |
| `meta.address.province`    | Property province     |                 |
| `meta.service.name`        | Line item name        |                 |
| `meta.service.price`       | Line item unitCost    |                 |
| `meta.addons[]`            | Additional line items |                 |
| `datetime`                 | Job startAt           | ISO 8601 format |
| Various meta fields        | Job description       | Formatted text  |

## Limitations

- Postal codes are not currently captured in the order form
- Some Jobber features (like quotes, invoicing) are not automatically managed
- The integration is one-way (ESG → Jobber); updates in Jobber don't sync back

## Future Enhancements

Potential improvements to consider:

1. **Webhooks**: Listen to Jobber webhooks for job status updates
2. **Two-way Sync**: Sync job status and updates back to ESG
3. **Advanced Features**: Support for quotes, invoices, and payments
4. **Custom Fields**: Map additional order metadata to Jobber custom fields
5. **Error Recovery**: Implement retry logic for transient failures

## Troubleshooting

### Authentication Issues

If you see "Failed to authenticate with Jobber API":

- Check that `JOBBER_CLIENT_ID` and `JOBBER_CLIENT_SECRET` are correctly set
- Verify the credentials are valid in the Jobber Developer Portal
- Ensure your app has the necessary scopes enabled

### Job Creation Failures

If jobs fail to create:

- Check the console logs for specific error messages
- Verify all required fields are present in the order data
- Ensure the client email is valid
- Check that address fields are properly formatted

### Testing Without Production Credentials

For development/testing without real Jobber credentials:

- The integration will fail gracefully if credentials are not set
- You can mock the `jobberClient` in tests (see test files for examples)
- Consider setting up a Jobber sandbox account for testing

## Support

For Jobber API documentation and support:

- [Jobber Developer Docs](https://developer.getjobber.com/docs)
- [Jobber GraphQL API](https://developer.getjobber.com/docs/using_jobbers_api/api_queries_and_mutations/)
- [Jobber Support](https://help.getjobber.com)
