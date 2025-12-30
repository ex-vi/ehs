import { BaseModel } from "./common";

export interface UserAttributes {
  username: string;
  email: string;
  password: string;
  confirmed: boolean;
  blocked: boolean;
  role: unknown;
}

export type User = BaseModel & UserAttributes;
