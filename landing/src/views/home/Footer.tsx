import Link from "next/link";

import { commonTranslation } from "@/core/translations/common";
import { Logo } from "@/components/logo";
import { Separator } from "@/components/ui/separator";

export default function Footer() {
  return (
    <footer className="bg-background section-padding-b" role="contentinfo" aria-label="Site footer">
      <div className="container-padding-x container mx-auto flex flex-col gap-12 lg:gap-16">
        <div className="flex flex-col gap-12">
          <div className="flex flex-col gap-12 md:items-center md:justify-between lg:flex-row">
            <div className="flex w-full flex-col items-center gap-12 lg:flex-row">
              <Link href="/" aria-label="Go to homepage">
                <Logo />
              </Link>

              <div className="flex w-full flex-1 justify-center md:justify-end">
                <nav
                  className="flex flex-col items-center gap-6 text-center md:flex-row md:gap-8"
                  aria-label="Footer navigation"
                >
                  {commonTranslation.navigation.map((item) => (
                    <Link
                      key={item.title}
                      href={item.link}
                      className="text-muted-foreground hover:text-foreground transition-colors"
                    >
                      {item.title}
                    </Link>
                  ))}
                </nav>
              </div>
            </div>
          </div>

          <Separator role="presentation" />

          <div className="flex flex-col items-center justify-between gap-12 text-center lg:flex-row">
            <p className="text-muted-foreground order-2 md:order-1">
              <span>{commonTranslation.footer.copyright(new Date().getFullYear().toString())}</span>
            </p>

            <nav
              className="order-1 flex flex-col items-center gap-6 md:order-2 md:flex-row md:gap-8"
              aria-label="Legal links"
            >
              {commonTranslation.footer.rights.map((rule) => (
                <Link
                  key={rule.title}
                  href={rule.link}
                  className="text-muted-foreground hover:text-foreground transition-colors"
                >
                  {rule.title}
                </Link>
              ))}
            </nav>
          </div>
        </div>
      </div>
    </footer>
  );
}
