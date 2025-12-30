import { commonTranslation } from "@/core/translations/common";

export default function ReviewsHeader() {
  return (
    <div className="flex w-full justify-center">
      <div className="section-title-gap-lg flex max-w-xl flex-col items-center text-center">
        <h2 id="pricing-section-title" className="heading-lg text-foreground">
          {commonTranslation.reviews.title}
        </h2>
        <p className="text-muted-foreground text-base">{commonTranslation.reviews.description}</p>
      </div>
    </div>
  );
}
