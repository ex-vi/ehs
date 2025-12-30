import { BaseModel } from "./common";

export interface QuestionAttributes {
  question: string;
  answer: string;
}

export type Question = BaseModel & QuestionAttributes;
