export type BaseModel = {
  id: number;
  createdAt: string;
  updatedAt: string;
  publishedAt: string;
  locale: string;
};

export type PaginatedDataResponse<T> = {
  data: T;
  pagination: {
    page: number;
    limit: number;
    offset: number;
    total: number;
  };
};

export type ImageFormat = {
  ext: string;
  url: string;
  hash: string;
  mime: string;
  name: string;
  path: string | null;
  size: number;
  width: number;
  height: number;
  sizeInBytes: number;
};

export type ImageFormats = {
  large: ImageFormat;
  medium: ImageFormat;
  small: ImageFormat;
  thumbnail: ImageFormat;
};

export type StrapiImage = BaseModel & {
  documentId: string;
  name: string;
  alternativeText: string | null;
  caption: string | null;
  width: number;
  height: number;
  formats: ImageFormats;
  hash: string;
  ext: string;
  mime: string;
  size: number;
  url: string;
  previewUrl: string | null;
  provider: string;
  provider_metadata: any;
  publishedAt: string;
};
