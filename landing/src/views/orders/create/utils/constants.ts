export type CleaningVariant =
  | "standard"
  | "deep"
  | "move-in"
  // | "after-renovation"
  | "kitchen"
  | "staircases"
  | "office"
  | "windows"
  | "renovations";

export interface HowWeCountExample {
  label: string;
  countsAs: number;
  image?: string;
}

export interface HowWeCount {
  intro: string;
  examples: HowWeCountExample[];
  rules?: string[];
  notes?: string[];
}

export interface OfficeSections {
  standardOffice?: {
    title: string;
    items: string[];
  };
  deepOffice?: {
    title: string;
    items: string[];
  };
}

export interface CleaningCardData {
  key: CleaningVariant;
  title: string;
  tagline: string;
  icon?: string;
  hero?: string;
  gallery?: string[];
  whatsIncluded?: string[];
  sections?: Record<string, any>;
  howWeCount?: HowWeCount;
  notes?: string[];
  addOns?: string[];
}

export type CleaningCardsMap = Record<CleaningVariant, CleaningCardData>;

const cleaningCards: CleaningCardsMap = {
  standard: {
    key: "standard",
    title: "Standard Cleaning",
    tagline: "A top-to-bottom refresh of every room — perfect for seasonal cleaning or long-overdue resets.",
    icon: "",
    hero: "/services/standard.svg",
    gallery: [],
    sections: {
      room: {
        title: "In the room:",
        items: [
          "Organize shoes and clothes",
          "Clean up and take out trash",
          "Dust all open surfaces",
          "Make the beds",
          "Clean mirrors",
          "Vacuum and mop the floor",
          "Wipe windowsills, baseboards, doors, handles, and switches",
        ],
      },
      bathroom: {
        title: "In the bathroom:",
        items: [
          "Wash and disinfect the toilet",
          "Wipe all surfaces",
          "Wash the floor and vacuum rugs",
          "Clean the bathtub, shower cabin, and faucets",
          "Wash the sink",
          "Wipe mirrors",
        ],
      },
      hallway: {
        title: "In the hallway:",
        items: ["Remove trash", "Wash the floor", "Neatly fold and hang clothes", "Arrange shoes", "Wipe mirrors"],
      },
      kitchen: {
        title: "In the kitchen:",
        items: [
          "Wipe windowsills, baseboards, doors, and switches",
          "Wash the floors",
          "Wipe furniture fronts",
          "Clean ceramic tiles",
          "Clean work surfaces",
          "Arrange chairs and tidy up",
          "Wash a small amount of dishes",
        ],
      },
    },
  },

  deep: {
    key: "deep",
    title: "Deep Cleaning",
    tagline: "A top-to-bottom refresh of every room — perfect for seasonal cleaning or long-overdue resets.",
    icon: "",
    hero: "/services/deep.svg",
    gallery: [],
    sections: {
      includes: [
        "Everything from the 'Standard Cleaning' package",
        "Mopping baseboards, wiping cornices and window blinds",
        "Vacuuming sofas and upholstered furniture",
        "Dry wiping of walls to remove dust",
        "Cleaning light fixtures",
        "Washing all interior doors and door frames",
        "Changing bed linens",
      ],
    },
  },

  "move-in": {
    key: "move-in",
    title: "Move-In / Move-Out Cleaning",
    tagline: "Perfect for end-of-lease or handing over your space to new residents.",
    icon: "",
    hero: "/services/packing.svg",
    gallery: [],
    sections: {
      livingAreas: {
        title: "Living areas:",
        items: [
          "Everything from Standard Cleaning",
          "Organizing items in closets",
          "Vacuuming sofa/upholstered furniture",
          "Dry dusting of walls",
          "Wiping light fixtures",
          "Cleaning all interior doors and frames",
          "Changing bed linens",
          "Space left clean and ready to welcome new people",
          "Cleaning window sills and radiators",
        ],
      },
      kitchenBath: {
        title: "Kitchen:",
        items: [
          "Organizing inside kitchen cabinets",
          "Cleaning kitchen fronts, tiles, and countertops",
          "Degreasing the stove, oven, and range hood",
          "Cleaning inside the fridge, microwave, and small appliances",
          "Washing floors, baseboards, and doors",
          "Disinfecting all work surfaces",
          "Cleaning the dishwasher inside and out",
        ],
      },
    },
  },

  // "after-renovation": {
  //   key: "after-renovation",
  //   title: "Cleaning after renovation",
  //   tagline: "Fast, thorough post-renovation cleaning to remove dust, stains, and construction traces from your space.",
  //   icon: "",
  //   hero: "/services/renovation.svg",
  //   gallery: [],
  //   sections: {
  //     kitchen: {
  //       title: "In the kitchen:",
  //       items: [
  //         "All surfaces and walls cleaned (except the ceiling)",
  //         "External and internal cleaning of household appliances (refrigerator, oven and stove, kitchen cabinets, hood, microwave, dishwasher)",
  //         "Floors, windowsills, baseboards, cabinets, and doors wiped clean",
  //         "Stains and construction dust removed",
  //         "Kitchen furniture fronts cleaned",
  //         "Inside of kitchen cabinets washed",
  //         "Trash collected and taken out",
  //       ],
  //     },
  //     bathroom: {
  //       title: "In the bathroom:",
  //       items: [
  //         "All surfaces and walls cleaned (except the ceiling)",
  //         "Floors, tiles, bathtub, toilet, doors, and mirrors washed",
  //         "Stains and material residues removed",
  //         "Interior parts of bathroom furniture cleaned",
  //         "Trash collected and taken out",
  //       ],
  //     },
  //     living: {
  //       title: "In living quarters:",
  //       items: [
  //         "Walls and surfaces cleaned (except the ceiling)",
  //         "Floors, windows, baseboards, doors, and windowsills washed",
  //         "Stains and dust removed",
  //         "Windows, frames, and windowsills washed",
  //         "Trash taken out",
  //       ],
  //     },
  //   },
  //   notes: ["We do not remove heavy construction debris or move furniture"],
  // },

  renovations: {
    key: "renovations",
    title: "Cleaning after renovation",
    tagline: "Fast, thorough post-renovation cleaning to remove dust, stains, and construction traces from your space.",
    icon: "",
    hero: "/services/renovation.svg",
    gallery: [],
    sections: {
      kitchen: {
        title: "In the kitchen:",
        items: [
          "All surfaces and walls cleaned (except the ceiling)",
          "External and internal cleaning of household appliances (refrigerator, oven and stove, kitchen cabinets, hood, microwave, dishwasher)",
          "Floors, windowsills, baseboards, cabinets, and doors wiped clean",
          "Stains and construction dust removed",
          "Kitchen furniture fronts cleaned",
          "Inside of kitchen cabinets washed",
          "Trash collected and taken out",
        ],
      },
      bathroom: {
        title: "In the bathroom:",
        items: [
          "All surfaces and walls cleaned (except the ceiling)",
          "Floors, tiles, bathtub, toilet, doors, and mirrors washed",
          "Stains and material residues removed",
          "Interior parts of bathroom furniture cleaned",
          "Trash collected and taken out",
        ],
      },
      living: {
        title: "In living quarters:",
        items: [
          "Walls and surfaces cleaned (except the ceiling)",
          "Floors, windows, baseboards, doors, and windowsills washed",
          "Stains and dust removed",
          "Windows, frames, and windowsills washed",
          "Trash taken out",
        ],
      },
    },
    notes: ["We do not remove heavy construction debris or move furniture"],
  },

  kitchen: {
    key: "kitchen",
    title: "Kitchen Cleaning",
    tagline:
      "A full-scope deep clean of your entire kitchen — inside, outside, top to bottom. This service takes 5–6 hours and leaves no corner untouched.",
    icon: "",
    hero: "/services/kitchen-cabinets.svg",
    gallery: [],
    sections: {
      includes: [
        "Organization of items inside kitchen cabinets",
        "Cleaning of work surfaces, kitchen fronts, outer surfaces of appliances, ceramic tiles, countertops, and windowsills",
        "Cleaning inside the refrigerator, oven and stove, kitchen cabinets, hood, microwave, and dishwasher",
        "Washing the floor, baseboards, doors, and windowsills",
        "Disinfection of all work surfaces",
        "Taking out the trash, replacing garbage bags, washing a small amount of dishes",
      ],
    },
    addOns: ["Window and balcony cleaning available as add-ons."],
  },

  staircases: {
    key: "staircases",
    title: "Stairwells Cleaning",
    tagline:
      "We clean staircases, hallways, lobbies, elevators, and other shared spaces in residential and commercial buildings.",
    icon: "",
    hero: "/services/stairwells.svg",
    gallery: [],
    whatsIncluded: [
      "Sweeping and mopping staircases and hallways",
      "Dusting railings, handrails, and baseboards",
      "Cleaning lobby doors, mirrors, and mailboxes",
      "Disinfecting switches and high-touch surfaces",
      "Wiping elevator doors, buttons, and panels",
    ],
  },
  office: {
    key: "office",
    title: "Office Cleaning",
    tagline:
      "We provide both regular and deep office cleanings — tailored to your space and schedule. You can book a one-time service or set up a recurring plan.",
    icon: "",
    hero: "/services/offices.svg",
    gallery: [],
    whatsIncluded: [
      "Daily, weekly, or bi-weekly maintenance cleaning",
      "Post-construction or post-renovation office cleaning",
      "Window cleaning (inside/outside)",
      "Carpet and upholstery deep cleaning",
      "Invoicing for businesses (B2B) available on request",
    ],
    sections: {
      standardOffice: {
        title: "Standard Office Cleaning:",
        items: [
          "Dusting all open surfaces and furniture",
          "Vacuuming or mopping floors",
          "Cleaning window sills and shelves",
          "Emptying trash bins",
          "Tidying up kitchen and bathroom areas",
        ],
      },
      deepOffice: {
        title: "Deep Office Cleaning:",
        items: [
          "Detailed cleaning from baseboards to light fixtures",
          "Hard-to-reach areas and deep grime removal",
          "Ideal for seasonal resets or preparing the office after a break",
        ],
      },
    },
  },
  windows: {
    key: "windows",
    title: "Window washing",
    tagline:
      "The minimum number of windows is 5. If you have fewer, order cleaning of a one-room apartment and specify the required number of windows.",
    icon: "",
    hero: "/services/window.svg",
    gallery: [],
    howWeCount: {
      intro: "We count windows based on their sections and size. Here’s how it works:",
      examples: [
        { label: "We count this as 1 window.", countsAs: 1, image: "/windows/one-window-also.svg" },
        { label: "We count this as 2 windows.", countsAs: 2, image: "/windows/two-windows.svg" },
        { label: "We count this as 3 windows.", countsAs: 3, image: "/windows/three-windows-also.svg" },
        {
          label: "We count this as 4 windows.",
          countsAs: 4,
          image: "/windows/four-windows.svg",
        },
      ],
      notes: [
        "One pane of a French window (floor-to-ceiling) = 1 window",
        "If your window has double frames (inner + outer), we count each frame separately — that’s 2 windows",
        "You can book window cleaning on its own, or together with apartment cleaning",
      ],
    },
  },
} as const;

export const CLEANING_CARDS: CleaningCardsMap = cleaningCards;
