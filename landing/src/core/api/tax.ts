"use server";

import { Tax } from "@/core/models/tax";
import { cmsClient } from "@/core/services/cmsClient";

export async function fetchTax(): Promise<Tax | null> {
  try {
    const res = await cmsClient("/tax");
    return res?.data || null;
  } catch (error) {
    console.error("Failed to fetch tax:", error);
    return null;
  }
}
