import { BaseModel } from "./common";

export interface AddonAttributes {
  slug: AddonSlug;
  name: string;
  price: number;
  worker_time: number;
  client_time: number;
}

export type Addon = BaseModel & AddonAttributes;

export type AddonSlug =
  | "oven"
  | "range-hood"
  | "dishwashing"
  | "fridge"
  | "double-fridge"
  | "microwave"
  | "balcony"
  | "window"
  | "ironing"
  | "litter-box"
  | "extra-hours"
  | "closet"
  | "dishwasher-machine"
  | "vacuum-cleaner"
  | "laundry"
  | "gardines"
  | "pet-cleaning";
