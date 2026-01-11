import Image from "next/image";

import { fetchHomePage } from "@/core/api/common";

import { HeroContent } from "./HeroContent";
import { HeroCounters } from "./HeroCounters";

export default async function Hero() {
  const homeData = await fetchHomePage();
  return (
    <section className="section-padding-y relative h-screen" aria-labelledby="page-heading">
      {homeData && (
        <Image
          src={"/hero-bg-v2.jpg"}
          alt="Hero background"
          fill
          blurDataURL={homeData?.hero_background.formats.thumbnail.url}
          className="pointer-events-none object-cover select-none"
          priority
          sizes="100vw"
        />
      )}

      <div className="container-padding-x relative z-10 container mx-auto flex h-full w-full flex-col items-center justify-center">
        <div className="mx-auto flex flex-1 flex-col items-center justify-center gap-4 text-center">
          <HeroContent />
          <HeroCounters />
        </div>
      </div>
    </section>
  );
}
