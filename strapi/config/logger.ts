import { winston } from "@strapi/logger";

const addServiceNameFormat = winston.format((info) => {
  info.timestamp = new Date().toISOString();
  info.service_name = process.env.SERVICE_NAME || "esg-strapi";
  return info;
});

export default winston.createLogger({
  level: process.env.LOG_LEVEL || "http",
  format: winston.format.combine(addServiceNameFormat(), winston.format.json()),
  transports: [new winston.transports.Console()],
});
