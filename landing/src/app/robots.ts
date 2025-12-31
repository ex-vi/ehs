import { MetadataRoute } from "next";

import { PUBLIC_URL } from "@/core/constants/common";

export default function robots(): MetadataRoute.Robots {
  return {
    rules: {
      userAgent: "*",
      allow: "/",
    },
    sitemap: PUBLIC_URL + "/sitemap.xml",
  };
}
