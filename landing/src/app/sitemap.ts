import { MetadataRoute } from "next";

export default function sitemap(): MetadataRoute.Sitemap {
  return [
    {
      url: process.env.PUBLIC_URL + "",
      lastModified: new Date(),
    },
    {
      url: process.env.PUBLIC_URL + "/login",
      lastModified: new Date(),
    },
    {
      url: process.env.PUBLIC_URL + "/orders",
      lastModified: new Date(),
    },
    {
      url: process.env.PUBLIC_URL + "/orders/create",
      lastModified: new Date(),
    },
    {
      url: process.env.PUBLIC_URL + "/privacy-policy",
      lastModified: new Date(),
    },
    {
      url: process.env.PUBLIC_URL + "/terms-of-service",
      lastModified: new Date(),
    },
    {
      url: process.env.PUBLIC_URL + "/cookie-policy",
      lastModified: new Date(),
    },
  ];
}
