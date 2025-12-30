import { Review } from "@/core/models/reviews";
import { CarouselItem } from "@/components/ui/carousel";

interface ReviewItemProps {
  review: Review;
  index: number;
}

export default function ReviewItem({ review, index }: ReviewItemProps) {
  return (
    <CarouselItem key={index} className="">
      <div className="mx-auto flex max-w-2xl flex-col items-center gap-6 px-2 md:gap-8 md:px-4">
        <blockquote className="text-foreground text-center text-base leading-7 font-medium sm:text-lg md:text-xl">
          &quot;{review.review}&quot;
        </blockquote>

        <div className="flex flex-col items-center gap-3 md:flex-row md:gap-4">
          <div className="flex flex-col items-center gap-0.5 md:items-start">
            <span className="text-foreground text-sm font-medium sm:text-base">{review.author}</span>
          </div>
        </div>
      </div>
    </CarouselItem>
  );
}
