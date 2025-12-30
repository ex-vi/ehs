import { FaqItem } from "@/core/models/faqs";
import { cmsClient } from "@/core/services/cmsClient";
import { Accordion } from "@/components/ui/accordion";

import FaqHeader from "./FaqHeader";
import FaqItemComponent from "./FaqItem";

export async function fetchFaqs(): Promise<FaqItem[]> {
  try {
    const res = await cmsClient("/questions");
    return res?.data || [];
  } catch (error) {
    console.error("Failed to fetch FAQs:", error);
    return [];
  }
}

export default async function Faq() {
  const faqs = await fetchFaqs();

  return (
    <section id="faq" className="bg-background section-padding-y scroll-mt-14" aria-labelledby="faq-heading">
      <div className="container-padding-x mx-auto flex max-w-2xl flex-col gap-10 md:gap-12">
        <FaqHeader />

        <Accordion type="single" collapsible={true} defaultValue="0" aria-label="FAQ items">
          {faqs?.map((faq, index) => (
            <FaqItemComponent key={index} faq={faq} index={index} />
          ))}
        </Accordion>
      </div>
    </section>
  );
}
