import Image from "next/image";
import Link from "next/link";

import { Contact } from "@/core/models/contacts";
import { cmsClient } from "@/core/services/cmsClient";
import { commonTranslation } from "@/core/translations/common";

export async function fetchContacts(): Promise<Contact[]> {
  try {
    const res = await cmsClient("/contacts");
    return res?.data || [];
  } catch (error) {
    console.error("Failed to fetch contacts:", error);
    return [];
  }
}

export default async function ContactUs() {
  const contacts = await fetchContacts();
  const socials = contacts.filter((contact) => contact.slug !== "phone" && contact.slug !== "email");
  const email = contacts.find((contact) => contact.slug === "email");

  return (
    <section id="contacts" className="bg-background section-padding-y scroll-mt-14" aria-labelledby="contact-heading">
      <div className="container-padding-x container mx-auto flex flex-col items-center gap-8 lg:flex-row lg:items-start lg:gap-12">
        <div className="flex flex-1 flex-col items-center justify-center">
          <div className="flex flex-col items-center gap-8 text-center">
            <div className="section-title-gap-lg mx-auto flex flex-col items-center text-center">
              <h1 id="contact-heading" className="heading-lg">
                {commonTranslation.contact.title}
              </h1>
              <p className="text-muted-foreground">{commonTranslation.contact.description}</p>
            </div>
            <div className="flex flex-row gap-5">
              {socials.map(({ link, title, slug }, index) => (
                <Link key={index} href={link} className="text-foreground transition-all duration-300 hover:scale-110">
                  <Image src={`/${slug}.svg`} alt={title} width={40} height={40} />
                </Link>
              ))}
              {email && commonTranslation.or}
              {email && (
                <Link
                  href={email?.link || ""}
                  className="text-foreground hover:text-primary underline underline-offset-4"
                >
                  {email?.title}
                </Link>
              )}
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
