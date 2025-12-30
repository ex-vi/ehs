import { BaseModel } from "./common";

export interface ServiceAttributes {
  slug: string;
  name: string;
  service_price: number;
  sqft_price: number;
  client_time: number;
  worker_time: number;

  extra_bedroom_price: number;
  extra_bedroom_worker_time: number;
  extra_bedroom_client_time: number;

  extra_bathroom_price: number;
  extra_bathroom_worker_time: number;
  extra_bathroom_client_time: number;

  extra_kitchen_price: number;
  extra_kitchen_worker_time: number;
  extra_kitchen_client_time: number;
}

export type Service = BaseModel & ServiceAttributes;
