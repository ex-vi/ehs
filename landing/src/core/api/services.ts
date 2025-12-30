"use server";

import { Service } from "@/core/models/services";
import { cmsClient } from "@/core/services/cmsClient";

const additionalRenovation = {
  id: 37,
  documentId: "qegspsrtsqzsqcadiw2zb1na",
  slug: "renovations",
  name: "Renovations",
  createdAt: "2025-10-13T20:31:32.869Z",
  updatedAt: "2025-10-23T08:58:27.332Z",
  publishedAt: "2025-10-23T08:58:27.355Z",
  locale: "en",
  service_price: 550,
  sqft_price: 0,
  worker_time: 465,
  client_time: 530,
  extra_bedroom_price: 45,
  extra_bathroom_price: 45,
  extra_kitchen_price: 60,
  extra_bedroom_worker_time: 35,
  extra_bedroom_client_time: 45,
  extra_bathroom_worker_time: 35,
  extra_bathroom_client_time: 45,
  extra_kitchen_worker_time: 50,
  extra_kitchen_client_time: 60,
};

export async function fetchServices(): Promise<Service[]> {
  try {
    const res = await cmsClient("/services");

    if (!res?.data) {
      return [];
    }

    return [...res?.data, additionalRenovation];
  } catch (error) {
    console.error("Failed to fetch services:", error);
    return [];
  }
}
