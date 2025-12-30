/**
 * Calculates percentage discount from coefficient
 * @param coefficient - Coefficient value (e.g., 0.8 for 20% discount)
 * @returns Percentage discount as number (e.g., 20 for 20%)
 */
export function getDiscountPercentageFromCoefficient(coefficient: number): number {
  return Math.round((1 - coefficient) * 100);
}

/**
 * Applies coefficient to a price
 * @param price - Original price
 * @param coefficient - Coefficient to apply (e.g., 0.8 for 20% discount)
 * @returns Discounted price
 */
export function applyCoefficient(price: number, coefficient: number): number {
  return price * coefficient;
}

/**
 * Calculates total service price including base service + rooms/bathrooms/kitchens
 * @param service - Service object with pricing data
 * @param rooms - Number of bedrooms
 * @param bathrooms - Number of bathrooms
 * @param kitchens - Number of kitchens
 * @param coefficient - Optional frequency coefficient to apply
 * @returns Total calculated price
 */
export function calculateServicePrice(
  service: {
    service_price: number;
    extra_bedroom_price: number;
    extra_bathroom_price: number;
    extra_kitchen_price: number;
  },
  rooms: number,
  bathrooms: number,
  kitchens: number,
  coefficient: number = 1
): number {
  const basePrice = service.service_price;
  const roomsPrice = rooms * service.extra_bedroom_price;
  const bathroomsPrice = bathrooms * service.extra_bathroom_price;
  const kitchensPrice = kitchens * service.extra_kitchen_price;

  const totalPrice = basePrice + roomsPrice + bathroomsPrice + kitchensPrice;

  return applyCoefficient(totalPrice, coefficient);
}
