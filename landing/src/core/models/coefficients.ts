import { BaseModel } from "./common";

export interface CoefficientAttributes {
  slug: string;
  coefficient: number;
  applies_to: string;
}

export type Coefficient = BaseModel & CoefficientAttributes;
