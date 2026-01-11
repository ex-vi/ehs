import Image from "next/image";

export async function HeroContent() {
  return (
    <Image
      src="/heroName.svg"
      alt="Hero Image"
      className="w-full max-[1025px]:max-w-[360px] min-[1025px]:max-w-[720px]"
      width={663}
      height={278}
    />
  );
}
