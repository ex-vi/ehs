"use server";

import { cmsClient } from "@/core/services/cmsClient";

export async function fetchHomePage() {
  try {
    const res = await cmsClient("/home-page?populate=*");
    return res?.data || null;
  } catch (error) {
    console.error("Failed to fetch home page:", error);
    return null;
  }
}
