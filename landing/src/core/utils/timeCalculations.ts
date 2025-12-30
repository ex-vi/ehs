import { SERVICES_WITH_BASE_ROOMS } from "@/core/constants/common";
import type { Addon } from "@/core/models/addons";
import type { OrderFormData } from "@/core/models/orders";
import type { Service } from "@/core/models/services";

export function calculateWorkerTime(formData: OrderFormData, services: Service[], addons: Addon[]): number {
  const selectedService = services.find((s) => s.slug === formData.service_type);
  let totalMinutes = 0;

  if (selectedService) {
    const hasBaseRooms = SERVICES_WITH_BASE_ROOMS.includes(selectedService.slug as any);

    totalMinutes += selectedService.worker_time;

    if (hasBaseRooms) {
      totalMinutes += Math.max(0, formData.rooms - 1) * selectedService.extra_bedroom_worker_time;
      totalMinutes += Math.max(0, formData.bathrooms - 1) * selectedService.extra_bathroom_worker_time;
      totalMinutes += Math.max(0, formData.kitchens - 1) * selectedService.extra_kitchen_worker_time;
    } else {
      totalMinutes += formData.rooms * selectedService.extra_bedroom_worker_time;
      totalMinutes += formData.bathrooms * selectedService.extra_bathroom_worker_time;
      totalMinutes += formData.kitchens * selectedService.extra_kitchen_worker_time;
    }
  }

  Object.entries(formData.selected_services).forEach(([addonSlug, quantity]) => {
    const addon = addons.find((a) => a.slug === addonSlug);
    if (addon && addon.worker_time && typeof quantity === "number" && quantity > 0) {
      totalMinutes += addon.worker_time * quantity;
    }
  });

  if (formData.is_vacuum_selected) {
    const vacuumAddon = addons.find((a) => a.slug === "vacuum-cleaner");
    if (vacuumAddon?.worker_time) {
      totalMinutes += vacuumAddon.worker_time;
    }
  }

  const roundedMinutes = Math.ceil(totalMinutes / 30) * 30;
  return roundedMinutes / 60;
}

export function calculateClientTime(formData: OrderFormData, services: Service[], addons: Addon[]): number {
  const selectedService = services.find((s) => s.slug === formData.service_type);
  let totalMinutes = 0;

  if (selectedService) {
    const hasBaseRooms = SERVICES_WITH_BASE_ROOMS.includes(selectedService.slug as any);

    totalMinutes += selectedService.client_time;

    if (hasBaseRooms) {
      totalMinutes += Math.max(0, formData.rooms - 1) * selectedService.extra_bedroom_client_time;
      totalMinutes += Math.max(0, formData.bathrooms - 1) * selectedService.extra_bathroom_client_time;
      totalMinutes += Math.max(0, formData.kitchens - 1) * selectedService.extra_kitchen_client_time;
    } else {
      totalMinutes += formData.rooms * selectedService.extra_bedroom_client_time;
      totalMinutes += formData.bathrooms * selectedService.extra_bathroom_client_time;
      totalMinutes += formData.kitchens * selectedService.extra_kitchen_client_time;
    }
  }

  Object.entries(formData.selected_services).forEach(([addonSlug, quantity]) => {
    const addon = addons.find((a) => a.slug === addonSlug);
    if (addon && addon.client_time && typeof quantity === "number" && quantity > 0) {
      totalMinutes += addon.client_time * quantity;
    }
  });

  if (formData.is_vacuum_selected) {
    const vacuumAddon = addons.find((a) => a.slug === "vacuum-cleaner");
    if (vacuumAddon?.client_time) {
      totalMinutes += vacuumAddon.client_time;
    }
  }

  const roundedMinutes = Math.ceil(totalMinutes / 30) * 30;
  return roundedMinutes / 60;
}

export function calculateBothTimes(
  formData: OrderFormData,
  services: Service[],
  addons: Addon[]
): {
  workerTime: number;
  clientTime: number;
} {
  return {
    workerTime: calculateWorkerTime(formData, services, addons),
    clientTime: calculateClientTime(formData, services, addons),
  };
}
