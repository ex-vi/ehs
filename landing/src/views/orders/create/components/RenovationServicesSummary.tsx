// TEMPORARY: Renovation services summary component
// This file can be easily removed when renovation services are no longer needed

"use client";

import type { RenovationServicesTotal } from "../utils/renovationCalculations";

interface RenovationServicesSummaryProps {
  renovation?: RenovationServicesTotal;
}

export function RenovationServicesSummary({ renovation }: RenovationServicesSummaryProps) {
  if (!renovation || renovation.services.length === 0) {
    return null;
  }

  return (
    <div className="space-y-2">
      <h3 className="text-sm font-medium">Renovation Services</h3>
      {renovation.services.map((service) => (
        <div key={service.id} className="flex items-center justify-between text-sm">
          <div className="flex-1">
            <div className="flex items-center gap-1">
              <span>{service.title}</span>
            </div>
            <div className="text-muted-foreground text-xs">
              {service.sqft} sq ft × ${service.unitPrice.toFixed(2)} CAD
            </div>
          </div>
          <div className="font-medium">${service.total.toFixed(2)}</div>
        </div>
      ))}
      {renovation.services.length > 1 && (
        <div className="border-border flex items-center justify-between border-t pt-1 text-sm font-medium">
          <span>Total Renovation Services</span>
          <span>${renovation.totalAmount.toFixed(2)}</span>
        </div>
      )}
    </div>
  );
}
