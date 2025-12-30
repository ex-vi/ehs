import { commonTranslation } from "@/core/translations/common";

export default async function AvailableIn() {
  return (
    <section id="map" className="bg-background h-fit scroll-mt-14 py-16 lg:py-24" aria-labelledby="cta-heading">
      <div className="container mx-auto flex flex-col items-center gap-12 px-6 lg:flex-row lg:gap-16">
        <div className="flex flex-1 flex-col gap-6 lg:gap-8">
          <div className="section-title-gap-lg flex flex-col">
            <h2 id="cta-heading" className="heading-lg text-foreground">
              {commonTranslation.availableIn.title}
            </h2>
            <p className="text-muted-foreground text-base">{commonTranslation.availableIn.description}</p>
          </div>
        </div>
        <div className="w-full flex-1">
          <div className="flex justify-center rounded-md *:w-full">
            <iframe
              title="Availability Map"
              src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCX0wQIz-PYLHbUqQjBUz7w2XavcDT49VU&q=Halifax,NS,Canada&language=en-CA&region=CA"
              width="600"
              height="340"
              allowFullScreen={true}
              loading="lazy"
              referrerPolicy="no-referrer-when-downgrade"
              className="rounded-xl"
            />
          </div>
        </div>
      </div>
    </section>
  );
}
