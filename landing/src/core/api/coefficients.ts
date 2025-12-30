"use server";

import { Coefficient } from "@/core/models/coefficients";
import { cmsClient } from "@/core/services/cmsClient";

export async function fetchCoefficients(): Promise<Coefficient[]> {
  try {
    const res = await cmsClient("/coefficients");
    return res?.data || [];
  } catch (error) {
    console.error("Failed to fetch coefficients:", error);
    return [];
  }
}
