import Image from "next/image";

import { StrapiImage } from "@/core/models/common";
import { cmsClient } from "@/core/services/cmsClient";

import LoginClient from "./LoginClient";

export type LoginPageData = {
  login_background: StrapiImage;
};

export async function fetchLoginData(): Promise<LoginPageData | null> {
  try {
    const res = await cmsClient("/login-page?populate=*");
    return res?.data;
  } catch (error) {
    console.error("Failed to fetch login data:", error);
    return null;
  }
}

export default async function Login() {
  const loginData = await fetchLoginData();

  return (
    <div className="relative min-h-screen w-full">
      {loginData?.login_background?.url && (
        <Image src={loginData?.login_background?.url} alt="Background" fill className="object-cover" priority />
      )}

      <LoginClient />
    </div>
  );
}
