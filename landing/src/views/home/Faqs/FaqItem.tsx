import { FaqItem } from "@/core/models/faqs";
import { AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion";

interface FaqItemComponentProps {
  faq: FaqItem;
  index: number;
}

export default function FaqItemComponent({ faq, index }: FaqItemComponentProps) {
  return (
    <AccordionItem key={index} value={index.toString()}>
      <AccordionTrigger className="text-left text-base font-medium">{faq.question}</AccordionTrigger>
      <AccordionContent className="text-foreground/80 text-sm">{faq.answer}</AccordionContent>
    </AccordionItem>
  );
}
