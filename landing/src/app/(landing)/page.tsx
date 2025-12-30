import WhyChooseUs from "@/views/home/Advantage";
import AvailableIn from "@/views/home/AvailableIn";
import ContactUs from "@/views/home/ContactUs";
import Faq from "@/views/home/Faqs";
import Hero from "@/views/home/Hero";
import HowMuchItCost from "@/views/home/HowMuchItCost";
import Reviews from "@/views/home/Reviews";
import WhatIsIncludeFull from "@/views/home/WhatIsIncludeFull";
import WhatIsIncludeYour from "@/views/home/WhatIsIncludeYour";

export const dynamic = "force-dynamic";

export default async function Home(props: PageProps<"/">) {
  const searchParams = (await props.searchParams) as Record<string, string> | undefined;

  return (
    <div>
      <Hero />
      <HowMuchItCost />
      <WhatIsIncludeFull searchParams={searchParams} />
      <AvailableIn />
      <WhatIsIncludeYour />
      <WhyChooseUs />
      <Reviews />
      <Faq />
      <ContactUs />
    </div>
  );
}
