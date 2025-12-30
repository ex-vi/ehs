import { GetCode } from "@/core/forms/auth/getCode";
import { LoginForm } from "@/core/forms/auth/login";

import { handleError } from "./utils";

export const login = async (body: LoginForm): Promise<{ access_token: string }> => {
  try {
    // const res = await cmsClient.post(`/auth/login`, body);
    // return { access_token: res.data.access_token };
    return { access_token: "mocked_token" };
  } catch (e: any) {
    throw handleError(e);
  }
};

export const getCode = async (body: GetCode) => {
  try {
    // const res = await cmsClient.post(`auth/send-code`, body);
    // return res.data;
    return true;
  } catch (e: any) {
    throw handleError(e);
  }
};

export const logout = async () =>
  // : Promise<{ status: number }>
  {
    try {
      // const res = await cmsClient.post(`/auth/logout`, {}, { withCredentials: true });
      // return { status: res.status };
    } catch (e: any) {
      throw handleError(e);
    }
  };
