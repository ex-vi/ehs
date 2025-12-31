type Translation = typeof translation;

const translation = {
  site: "Easy Home Services",
  from: "From",
  termsLink: "terms-of-service",
  login: "Login",
  forOneRoom: "for 1-bedroom",
  whatIsIncluded: "What’s included:",
  bookNow: "Book Now",
  date: "Date",
  cad: "CAD",
  cleaningAndRenovations: "Cleaning & Renovations",
  navigation: [
    { title: "Order Cleaning", link: "/#" },
    { title: "Prices", link: "/#prices" },
    { title: "Map", link: "/#map" },
    { title: "Why Choose Us", link: "/#why-us" },
    { title: "What’s Included", link: "/#included" },
    { title: "Reviews", link: "/#reviews" },
    { title: "FAQ", link: "/#faq" },
    { title: "Contact Us", link: "/#contacts" },
  ],
  hero: {
    title: "A spotless home, just a click away!",
    description: "Fast booking, clear pricing, and a spotless result — only from",
    counter: {
      rooms: "Rooms",
      bathroom: "Bathroom",
      kitchen: "Kitchen",
      seePrice: "See Price",
    },
  },
  howMuchItCost: {
    title: "How much does it cost?",
    description:
      "Whether you need a quick refresh or a deep clean, our packages are designed to fit your home, office, or move. Explore what’s included, compare options, and book online in minutes.",
    tabs: [
      {
        slug: "discount-weekly",
        title: "Once a week",
      },
      {
        slug: "discount-biweekly",
        title: "Twice a month",
      },
      {
        slug: "discount-monthly",
        title: "Monthly",
      },
      {
        slug: "discount-once",
        title: "One-time",
      },
    ],
    cards: [
      {
        rooms: 1,
        title: "1-bedroom",
        description: "Includes cleaning of one bedroom, kitchen, entryway, and one bathroom — once per week.",
      },
      {
        rooms: 2,
        title: "2-bedroom",
        description: "Includes cleaning of one bedroom, kitchen, entryway, and one bathroom — once per week.",
      },
      {
        rooms: 3,
        title: "3-bedroom",
        description: "Includes cleaning of one bedroom, kitchen, entryway, and one bathroom — once per week.",
      },
    ],
  },
  availableIn: {
    title: "Available in Halifax and suburbs",
    description: "We currently serve Halifax and nearby communities. Expanding soon to more Canadian cities.",
  },
  whatIsIncludeYour: {
    title: "What’s Included in Your Cleaning",
    description:
      "Every cleaning is detailed and thorough. From living spaces to kitchen, hallway, and bathroom — here’s exactly what we take care of in each area.",
    tabs: ["room", "bathroom", "kitchen", "hallway"],
  },
  whyChooseUs: {
    title: "Why Choose Us?",
    description:
      "Your time matters. That’s why our service is built around convenience. Be confident that everything will be handled with care — simple process, reliable people, and a home that feels fresh without extra effort on your side.",
  },
  whatIsIncludeFull: {
    title: "What’s Included in a Full Home Cleaning?",
    description:
      "Professional cleaning in Halifax with Easy Home Services is a complete approach to keeping your home fresh and spotless. We cover everything needed so your space shines with cleanliness. Our services include:",
    prices: [
      {
        slug: "standard",
        description:
          "Full cleaning of your bedroom, kitchen, entryway, and bathroom — everything you need in one visit.",
        included: [
          "Organizing clothes, shoes, and general items",
          "Dusting all open and reachable surfaces",
          "Vacuuming carpets, mopping all floors and baseboards",
          "Cleaning bathroom fixtures and disinfecting surfaces",
          "Wiping mirrors, windowsills, doors, and switches",
          "Tidying kitchen surfaces and furniture fronts",
          "Removing trash throughout all rooms",
        ],
      },
      {
        slug: "deep",
        description:
          "Deep cleaning of your apartment or house — with no dust or dirt left behind. Perfect for special occasions.",
        badge: "Most Popular",
        included: [
          "Everything from the Standard Cleaning package",
          "Mopping baseboards, wiping cornices and window blinds",
          "Vacuuming sofas and upholstered furniture",
          "Dry wiping of walls to remove dust",
          "Cleaning light fixtures",
          "Washing all interior doors and door frames",
          "Changing bed linens",
        ],
      },
      {
        slug: "move-in",
        description:
          "Complete cleaning before or after your move — leave your old place spotless or start fresh in your new home.",
        included: [
          "Standard Cleaning of all rooms",
          "Organizing closets and kitchen cabinets",
          "Vacuuming sofas and upholstered furniture",
          "Dusting walls, light fixtures, window sills, and radiators",
          "Cleaning interior doors, frames, and baseboards",
          "Degreasing and cleaning stove, oven, range hood, fridge, microwave, dishwasher, and small appliances",
          "Cleaning kitchen fronts, tiles, countertops, and floors",
          "Scrubbing and disinfecting bathrooms",
          "Changing bed linens",
          "Trash removal and leaving the space move-in ready",
        ],
      },
    ],
  },
  reviews: {
    title: "What our clients say",
    description: "See how our clients describe the requests they made, the time it took, and the results they enjoyed.",
  },
  faq: {
    title: "Frequently Asked Questions",
    description:
      "We believe everything about our service should be easy to understand and free of surprises. Here you’ll find clear answers to the things people ask most, so you can book with confidence.",
  },
  contact: {
    title: "Contact Us",
    description: "Chat with a real person — no bots, no scripts. Quick answers through:",
  },
  footer: {
    rights: [
      { title: "Privacy Policy", link: "/privacy-policy" },
      { title: "Terms of Service", link: "/terms-of-service" },
      { title: "Cookies Settings", link: "/cookie-policy" },
    ],
    copyright: (year: string) => `Copyright ${year} © `,
  },
  toHomePage: "To Home Page",
};

export const commonTranslation: Translation = translation;
