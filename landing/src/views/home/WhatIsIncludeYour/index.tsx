import WhatIsIncludeYourClient from "./Client";
import { fetchFeatures } from "./fetcher";

export default async function WhatIsIncludeYour() {
  const features = await fetchFeatures();

  return (
    <div id="included" className="pt-4">
      <WhatIsIncludeYourClient features={features} />
    </div>
  );
}
