import { Review } from "@/core/models/reviews";
import { cmsClient } from "@/core/services/cmsClient";

import ReviewsCarousel from "./ReviewsCarousel";
import ReviewsHeader from "./ReviewsHeader";

export async function fetchReviews(): Promise<Review[]> {
  try {
    const res = await cmsClient("/reviews");
    return res?.data || [];
  } catch (error) {
    console.error("Failed to fetch reviews:", error);
    return [];
  }
}

export default async function Reviews() {
  const reviews = await fetchReviews();

  return (
    <section
      id="reviews"
      className="bg-muted container-padding-x section-padding-y flex scroll-mt-14 flex-col items-center"
      aria-labelledby="review-carousel"
    >
      <div className="w-full max-w-4xl">
        <ReviewsHeader />
        <ReviewsCarousel reviews={reviews} />
      </div>
    </section>
  );
}
