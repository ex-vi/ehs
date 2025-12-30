/**
 * Type definitions for Jobber API responses
 */

export interface JobberClient {
  id: string;
  firstName: string;
  lastName: string;
  email: string;
}

export interface JobberProperty {
  id: string;
  address: {
    street1: string;
    street2?: string;
    city: string;
    province: string;
    postalCode?: string;
  };
}

export interface JobberJob {
  id: string;
  jobNumber: string;
  title: string;
  description?: string;
  client?: {
    id: string;
    name: string;
  };
  property?: {
    id: string;
    address: {
      street1: string;
      street2?: string;
      city: string;
      province: string;
      postalCode?: string;
    };
  };
  visits?: {
    edges: Array<{
      node: {
        id: string;
        startAt: string;
        endAt?: string;
      };
    }>;
  };
  lineItems?: {
    edges: Array<{
      node: {
        id: string;
        name: string;
        description?: string;
        quantity: number;
        unitCost: number;
        total: number;
      };
    }>;
  };
  total?: number;
}

export interface JobberUserError {
  message: string;
  path?: string[];
}

export interface JobberGraphQLResponse<T> {
  data?: T;
  errors?: Array<{
    message: string;
    locations?: Array<{ line: number; column: number }>;
    path?: string[];
  }>;
}

export interface CreateJobberOrderResult {
  success: boolean;
  jobId?: string;
  jobNumber?: string;
  data?: JobberJob;
  error?: string;
}
