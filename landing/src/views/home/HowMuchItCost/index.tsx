import { fetchCoefficients } from "@/core/api/coefficients";
import { fetchServices } from "@/core/api/services";

import HowMuchItCostClient from "./HowMuchItCostClient";

export default async function HowMuchItCost() {
  const coefficients = await fetchCoefficients();
  const services = await fetchServices();
  const standardService = services?.find((s) => s.slug === "standard");

  return <HowMuchItCostClient coefficients={coefficients} standardService={standardService} />;
}
