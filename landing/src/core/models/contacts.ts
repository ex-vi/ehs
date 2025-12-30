import { BaseModel } from "./common";

export interface ContactAttributes {
  title: string;
  link: string;
  slug: string;
}

export type Contact = BaseModel & ContactAttributes;
