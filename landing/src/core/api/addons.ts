"use server";

import { Addon } from "@/core/models/addons";
import { cmsClient } from "@/core/services/cmsClient";

export async function fetchAddons(): Promise<Addon[]> {
  try {
    const res = await cmsClient("/addons");
    return res?.data || [];
  } catch (error) {
    console.error("Failed to fetch addons:", error);
    return [];
  }
}
