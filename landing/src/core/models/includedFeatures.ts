import { BaseModel, StrapiImage } from "./common";

export interface IncludedFeatureOptionAttributes {
  text: string;
}

export type IncludedFeatureOption = BaseModel & IncludedFeatureOptionAttributes;

export interface IncludedFeatureAttributes {
  slug: string;
  title: string;
  image_desktop: StrapiImage;
  image_mobile: StrapiImage;
  options: IncludedFeatureOptionAttributes[];
}

export type IncludedFeature = BaseModel & IncludedFeatureAttributes;
