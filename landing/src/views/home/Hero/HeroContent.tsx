import { Chewy } from "next/font/google";

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
      <h1
        className={cn(
          chewy.className,
          "relative inline-block text-[62px] leading-[70px] tracking-[-5px] text-white sm:text-[88px] sm:leading-[111px] md:max-w-[80%] lg:text-[104px]"
        )}
      >
        <span
          aria-hidden
          className="pointer-events-none absolute inset-0 text-transparent select-none"
          style={{
            WebkitTextStrokeWidth: "10px",
            WebkitTextStrokeColor: "var(--esg-blue)",
          }}
        >
          Easy Home Services
        </span>

        <span
          className="relative text-white"
          style={{
            fontSynthesis: "weight",
            fontWeight: 500,

            textShadow: `
        0 0 0.6px #fff,
        0 0 0.6px #fff,
        0 0 0.6px #fff
      `,
          }}
        >
          Easy Home Services
        </span>
      </h1>

      <p
        style={{
          WebkitTextStrokeWidth: "2px",
          WebkitTextStrokeColor: "var(--esg-blue)",
          color: "white",
          textShadow: "0 0 1px var(--esg-blue)",
        }}
        className={cn(chewy.className, "text-[32px] font-bold text-white sm:text-[48px] lg:text-[64px]")}
      >
        {commonTranslation.cleaningAndRenovations}
      </p>
    </div>
  );
}
