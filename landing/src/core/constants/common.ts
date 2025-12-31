export const BASE_TIMEOUT = 10000;

export const API_BASE_URL = process.env.API_BASE_URL;
export const AUTH_API_KEY = process.env.AUTH_API_KEY;

export const STRAPI_BASE_URL = process.env.STRAPI_BASE_URL;

export const JOBBER_API_URL = "https://api.getjobber.com/api/graphql";
export const JOBBER_CLIENT_ID = process.env.JOBBER_CLIENT_ID;
export const JOBBER_CLIENT_SECRET = process.env.JOBBER_CLIENT_SECRET;

export const STRAPI_REVALIDATION_SECONDS = process.env.NODE_ENV === "production" ? 1800 : 0;

export const INDIVIDUAL_SERVICE_ORDER = [
  "standard",
  "deep",
  "move-in",
  // "after-renovation",
  "kitchen",
  "windows",
  "office",
  "staircases",
] as const;

export const BUSINESS_SERVICE_ORDER = ["renovations"] as const;

export const SERVICES_WITH_DISCOUNTS = [
  "standard",
  "deep",
  "move-in",
  // "after-renovation",
  "renovations",
  "kitchen",
  "windows",
  "office",
  "staircases",
] as const;

export const ADDON_ORDER = [
  "fridge",
  "double-fridge",
  "oven",
  "microwave",
  "range-hood",
  "dishwasher-machine",
  "dishwashing",
  "ironing",
  "laundry",
  "window",
  "gardines",
  "balcony",
  "closet",
  "pet-cleaning",
  "litter-box",
  "extra-hours",
] as const;

export const RENOVATION_SERVICES_ORDER = [
  "painting",
  "laminate-flooring",
  "baseboard-installation",
  "drywall-installation",
  "vinyl-siding",
  "insulations",
];

export const SERVICES_WITH_BASE_ROOMS = ["standard", "deep", "move-in", "after-renovation"] as const;
