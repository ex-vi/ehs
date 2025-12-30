import { commonTranslation } from "@/core/translations/common";

export default function FaqHeader() {
  return (
    <div className="section-title-gap-lg flex flex-col items-center text-center">
      <h1 id="faq-heading" className="heading-lg text-foreground">
        {commonTranslation.faq.title}
      </h1>
      <p className="text-muted-foreground">{commonTranslation.faq.description}</p>
    </div>
  );
}
