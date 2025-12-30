import { STRAPI_BASE_URL, STRAPI_REVALIDATION_SECONDS } from "@/core/constants/common";

export async function cmsClient(path: string, options: RequestInit = {}) {
  const res = await fetch(`${STRAPI_BASE_URL}${path}`, {
    ...options,
    headers: {
      "Content-Type": "application/json",
      ...(options.headers || {}),
    },
    next: { revalidate: STRAPI_REVALIDATION_SECONDS },
  });

  if (!res.ok) throw new Error(`CMS request failed: ${JSON.stringify(res)}`);
  return res.json();
}
