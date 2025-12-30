import { BaseModel } from "./common";

export interface AdvantageAttributes {
  icon_slug: string;
  title: string;
  description: string;
}

export type Advantage = BaseModel & AdvantageAttributes;
