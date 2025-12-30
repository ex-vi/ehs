import { BaseModel, StrapiImage } from "./common";

export type Feature = BaseModel & {
  slug: "room" | "kitchen" | "hallway" | "bathroom";
  title: string;
  options: FeatureOption[];
  image_desktop: StrapiImage;
  image_mobile: StrapiImage;
};

export type FeatureOption = BaseModel & {
  text: string;
};
