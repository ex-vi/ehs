import axios, { AxiosInstance } from "axios";

import { JOBBER_API_URL } from "../constants/common";
import { JobberJob } from "./jobberTypes";

class JobberClient {
  private client: AxiosInstance;

  constructor() {
    this.client = axios.create({
      baseURL: JOBBER_API_URL,
      timeout: 30000,
      headers: {
        "Content-Type": "application/json",
      },
    });
  }

  /**
   * Execute a GraphQL query or mutation with a provided access token
   */
  async graphql<T>(accessToken: string, query: string, variables?: Record<string, unknown>): Promise<T> {
    try {
      const response = await this.client.post(
        "",
        {
          query,
          variables,
        },
        {
          headers: {
            Authorization: `Bearer ${accessToken}`,
            "X-JOBBER-GRAPHQL-VERSION": "2025-04-16",
          },
        }
      );

      if (response.data.errors) {
        console.error("GraphQL errors:", response.data.errors);
        throw new Error(response.data.errors[0]?.message || "GraphQL request failed");
      }

      return response.data.data;
    } catch (error: any) {
      console.error("Jobber GraphQL request failed:", error);
      throw error;
    }
  }

  /**
   * Create a job in Jobber
   */
  async createJob(
    accessToken: string,
    input: {
      clientId: string;
      title: string;
      description?: string;
      propertyId?: string;
      startAt?: string;
      lineItems?: Array<{
        name: string;
        description?: string;
        unitCost: number;
        quantity: number;
      }>;
    }
  ): Promise<JobberJob> {
    const mutation = `
      mutation CreateJob($input: JobCreateAttributes!) {
        jobCreate(input: $input) {
          job {
            id
            jobNumber
            title
            instructions
            client {
              id
              name
            }
            property {
              id
              address {
                street
                city
                province
                postalCode
              }
            }
            visits {
              edges {
                node {
                  id
                  startAt
                  endAt
                }
              }
            }
            lineItems {
              edges {
                node {
                  id
                  name
                  description
                  quantity
                  unitCost
                }
              }
            }
          }
          userErrors {
            message
            path
          }
        }
      }
    `;

    // Build the JobCreateAttributes input according to Jobber API schema
    const jobInput = {
      propertyId: input.propertyId,
      title: input.title,
      instructions: input.description,
      lineItems:
        input.lineItems?.map((item) => ({
          name: item.name,
          description: item.description || "",
          unitPrice: item.unitCost,
          quantity: item.quantity,
          saveToProductsAndServices: false,
        })) || [],
      invoicing: {
        invoicingType: "VISIT_BASED",
        invoicingSchedule: "PER_VISIT",
      },
      ...(input.startAt && {
        timeframe: {
          startAt: input.startAt,
        },
      }),
    };

    const result = await this.graphql<{
      jobCreate: {
        job?: JobberJob;
        userErrors?: Array<{ message: string; path?: string[] }>;
      };
    }>(accessToken, mutation, { input: jobInput });

    if (result.jobCreate?.userErrors && result.jobCreate.userErrors.length > 0) {
      throw new Error(result.jobCreate.userErrors[0].message);
    }

    if (!result.jobCreate?.job) {
      throw new Error("Job creation returned no data");
    }

    return result.jobCreate.job;
  }

  /**
   * Get or create a client in Jobber
   */
  async getOrCreateClient(
    accessToken: string,
    input: {
      firstName: string;
      lastName: string;
      email: string;
      phone?: string;
    }
  ): Promise<string> {
    // Skip searching for existing clients for now (PoC stage)
    // Always create a new client

    // Create new client
    const createMutation = `
      mutation CreateClient($input: ClientCreateInput!) {
        clientCreate(input: $input) {
          client {
            id
            firstName
            lastName
            emails {
              address
              primary
            }
          }
          userErrors {
            message
            path
          }
        }
      }
    `;

    const createResult = await this.graphql<{
      clientCreate: {
        client?: {
          id: string;
          firstName: string;
          lastName: string;
          emails: Array<{
            address: string;
            primary: boolean;
          }>;
        };
        userErrors?: Array<{ message: string; path?: string[] }>;
      };
    }>(accessToken, createMutation, {
      input: {
        firstName: input.firstName,
        lastName: input.lastName,
        emails: [{ address: input.email, primary: true }],
        ...(input.phone && { phones: [{ number: input.phone, primary: true }] }),
      },
    });

    if (createResult.clientCreate?.userErrors && createResult.clientCreate.userErrors.length > 0) {
      throw new Error(createResult.clientCreate.userErrors[0].message);
    }

    if (!createResult.clientCreate?.client?.id) {
      throw new Error("Client creation returned no ID");
    }

    return createResult.clientCreate.client.id;
  }

  /**
   * Create a property for a client in Jobber
   */
  async createProperty(
    accessToken: string,
    input: {
      clientId: string;
      address: {
        street1: string;
        street2?: string;
        city: string;
        province: string;
        postalCode?: string;
      };
    }
  ): Promise<string> {
    const mutation = `
      mutation PropertyCreate($clientId: EncodedId!, $input: PropertyCreateInput!) {
        propertyCreate(clientId: $clientId, input: $input) {
          properties {
            id
          }
          userErrors {
            message
            path
          }
        }
      }
    `;

    const result = await this.graphql<{
      propertyCreate: {
        properties?: Array<{
          id: string;
          address: {
            street: string;
            city: string;
            province: string;
            postalCode?: string;
          };
        }>;
        userErrors?: Array<{ message: string; path?: string[] }>;
      };
    }>(accessToken, mutation, {
      clientId: input.clientId,
      input: {
        properties: [
          {
            //name: "Client's Property",
            address: {
              street1: input.address.street1,
              street2: input.address.street2 ?? "",
              city: capitalize(input.address.city),
              country: "Canada",
              province: input.address.province,
              postalCode: input.address.postalCode,
            },
          },
        ],
      },
    });

    if (result.propertyCreate?.userErrors && result.propertyCreate.userErrors.length > 0) {
      throw new Error(result.propertyCreate.userErrors[0].message);
    }

    if (!result.propertyCreate?.properties?.[0]?.id) {
      throw new Error("Property creation returned no ID");
    }

    return result.propertyCreate.properties[0].id;
  }
}

function capitalize(val: string) {
  return val.charAt(0).toUpperCase() + val.slice(1);
}

const jobberClient = new JobberClient();
export default jobberClient;
