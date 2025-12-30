"use client";

import { useEffect, useState } from "react";

import { cn } from "@/core/lib/utils";
import { Review } from "@/core/models/reviews";
import { Carousel, CarouselContent, CarouselNext, CarouselPrevious, type CarouselApi } from "@/components/ui/carousel";

import ReviewItem from "./ReviewItem";

interface ReviewsCarouselProps {
  reviews: Review[];
}

export default function ReviewsCarousel({ reviews }: ReviewsCarouselProps) {
  const [api, setApi] = useState<CarouselApi>();
  const [current, setCurrent] = useState(0);
  const [count, setCount] = useState(0);

  useEffect(() => {
    if (!api) {
      return;
    }

    const update = () => {
      setCount(api.scrollSnapList().length);
      setCurrent(api.selectedScrollSnap());
    };

    update();
    api.on("select", () => {
      setCurrent(api.selectedScrollSnap());
    });

    return () => {
      api.off("select", update);
    };
  }, [api]);

  return (
    <Carousel className="relative mx-auto" setApi={setApi} opts={{ loop: true }}>
      <div className="pointer-events-none absolute inset-y-0 right-0 left-0 z-10 hidden items-center justify-between md:flex">
        <div className="pointer-events-auto">
          <CarouselPrevious className="relative left-[-1rem] h-10 w-10" />
        </div>
        <div className="pointer-events-auto">
          <CarouselNext className="relative right-[-1rem] h-10 w-10" />
        </div>
      </div>

      <CarouselContent className="mt-16 px-2 sm:px-4">
        {reviews?.map((Review, index) => (
          <ReviewItem key={index} review={Review} index={index} />
        ))}
      </CarouselContent>

      <div className="mt-8 flex justify-center gap-1.5 md:hidden">
        {Array.from({ length: count }).map((_, i) => (
          <button
            key={i}
            className={cn(
              "h-2 w-2 rounded-full transition-all",
              current === i ? "bg-primary w-4" : "bg-muted-foreground/20"
            )}
            aria-label={`Go to slide ${i + 1}`}
            onClick={() => api?.scrollTo(i)}
          />
        ))}
      </div>
    </Carousel>
  );
}
