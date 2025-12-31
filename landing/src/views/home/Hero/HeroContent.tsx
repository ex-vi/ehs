import { Chewy } from "next/font/google";
import Image from "next/image";

import { cn } from "@/core/lib/utils";
import { commonTranslation } from "@/core/translations/common";

const chewy = Chewy({ subsets: ["latin"], weight: ["400"] });

export async function HeroContent() {
  return (
    <div
      className="mx-6 flex flex-col items-center rounded-lg p-6 px-0 pb-0 md:px-5"
      style={{
        lineHeight: "normal",
      }}
    >
      <Image
        src="/heroName.svg"
        alt="Hero Image"
        className="w-full max-[1025px]:max-w-[420] min-[1025px]:max-w-[660px]"
        width={312}
        height={130}
      />

      <p
        style={{
          WebkitTextStrokeWidth: "2px",
          WebkitTextStrokeColor: "var(--esg-blue)",
          color: "white",
          textShadow: "0 0 1px var(--esg-blue)",
        }}
        className={cn(
          chewy.className,
          "text-[32px] font-bold text-white max-[1025px]:text-[48px] min-[1025px]:text-[64px]"
        )}
      >
        {commonTranslation.cleaningAndRenovations}
      </p>
    </div>
  );
}
