import { MetadataRoute } from "next";

import { PUBLIC_URL } from "@/core/constants/common";

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    {
      url: PUBLIC_URL + "",
      lastModified: new Date(),
    },
    {
      url: PUBLIC_URL + "/login",
      lastModified: new Date(),
    },
    {
      url: PUBLIC_URL + "/orders",
      lastModified: new Date(),
    },
    {
      url: PUBLIC_URL + "/orders/create",
      lastModified: new Date(),
    },
    {
      url: PUBLIC_URL + "/privacy-policy",
      lastModified: new Date(),
    },
    {
      url: PUBLIC_URL + "/terms-of-service",
      lastModified: new Date(),
    },
    {
      url: PUBLIC_URL + "/cookie-policy",
      lastModified: new Date(),
    },
  ];
}
