FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# ---------- Runtime ----------
FROM nginxinc/nginx-unprivileged:alpine

# Remove default config
RUN rm -f /etc/nginx/conf.d/default.conf

# Copy nginx server config
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy React build
COPY --from=builder /app/dist /usr/share/nginx/html

EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
