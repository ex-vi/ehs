"use server";

import { IncludedFeature } from "@/core/models/includedFeatures";
import { cmsClient } from "@/core/services/cmsClient";

export async function fetchIncludedFeatures(): Promise<IncludedFeature[]> {
  try {
    const res = await cmsClient("/included-features");
    return res?.data || [];
  } catch (error) {
    console.error("Failed to fetch included features:", error);
    return [];
  }
}
