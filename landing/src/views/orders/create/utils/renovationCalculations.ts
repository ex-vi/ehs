// TEMPORARY: Renovation services calculation logic
// This file can be easily removed when renovation services are no longer needed

import type { Service } from "@/core/models/services";

export type RenovationServiceData = {
  sqft: number;
  hasAddOn: boolean;
  price: number;
};

export type RenovationServicesTotal = {
  services: Array<{
    id: string;
    title: string;
    sqft: number;
    unitPrice: number;
    hasAddOn: boolean;
    total: number;
  }>;
  totalAmount: number;
};

export function calculateRenovationServices(
  renovationData: Record<string, Service & { sqft: number }>,
  renovationServices: Service[]
): RenovationServicesTotal {
  const services = [];
  let totalAmount = 0;

  for (const [serviceSlug, serviceWithSqft] of Object.entries(renovationData)) {
    if (serviceWithSqft.sqft > 0) {
      const serviceTotal = serviceWithSqft.sqft * serviceWithSqft.sqft_price;
      totalAmount += serviceTotal;

      services.push({
        id: serviceSlug,
        title: serviceWithSqft.name,
        sqft: serviceWithSqft.sqft,
        unitPrice: serviceWithSqft.sqft_price,
        hasAddOn: false,
        total: serviceTotal,
      });
    }
  }

  return {
    services,
    totalAmount,
  };
}
