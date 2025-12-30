import { BaseModel } from "./common";

export type FaqItem = BaseModel & {
  question: string;
  answer: string;
};
