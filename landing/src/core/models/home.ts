import { BaseModel, StrapiImage } from "./common";

export type HomePageData = BaseModel & {
  price_from: number;
  hero_background: StrapiImage;
  location_map: StrapiImage;
  localizations: any[];
};

export type HomePageResponse = {
  data: HomePageData;
};

export type HomePagePrice = Pick<HomePageData, keyof BaseModel | "price_from">;
