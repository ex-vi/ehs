import { BaseModel } from "./common";

export interface TaxAttributes {
  vat: number;
}

export type Tax = BaseModel & TaxAttributes;
