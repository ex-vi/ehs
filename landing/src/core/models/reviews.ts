import { BaseModel } from "./common";

export interface ReviewAttributes {
  author: string;
  review: string;
}

export type Review = BaseModel & ReviewAttributes;
