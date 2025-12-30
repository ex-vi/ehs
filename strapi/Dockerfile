# Do not update to 24. Keep 22, it's a Strapi requirement
FROM node:22-alpine AS base


# Install dependencies
FROM base AS deps

RUN apk add --no-cache libc6-compat
WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci


# Build the source code
FROM base AS builder

WORKDIR /app

COPY --from=deps /app/node_modules ./node_modules
COPY . .

ENV NODE_ENV=production

RUN npm run build


# Production run
FROM base AS runner

WORKDIR /app

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 strapi

COPY --from=builder /app .

# Set permissions
RUN chown strapi:nodejs /app

USER strapi

EXPOSE 1337

ENV PORT=1337
ENV HOSTNAME="0.0.0.0"
ENV BROWSER=false
ENV NODE_ENV=production
ENV STRAPI_TELEMETRY_DISABLED=true

CMD ["npm", "run", "start"]
