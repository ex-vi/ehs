export default ({ env }) => ({
  upload: {
    config: {
      provider: "aws-s3",
      providerOptions: {
        s3Options: {
          credentials: {
            accessKeyId: env("BUCKET_ACCESS_KEY"),
            secretAccessKey: env("BUCKET_SECRET_KEY"),
          },
          region: env("BUCKET_REGION"),
          endpoint: `https://${env("BUCKET_ENDPOINT")}`,
          params: {
            Bucket: env("BUCKET_NAME"),
          },
        },
      },
    },
  },
});
