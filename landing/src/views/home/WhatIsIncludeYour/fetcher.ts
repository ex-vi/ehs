"use server";

import { Feature } from "@/core/models/features";
import { cmsClient } from "@/core/services/cmsClient";

export async function fetchFeatures(): Promise<Feature[] | null> {
  try {
    const res = await cmsClient("/features?populate=*");
    return res?.data || [];
  } catch (error) {
    console.error("Failed to fetch features:", error);
    return null;
  }
}
