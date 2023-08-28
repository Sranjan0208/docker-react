# Phases: 1. Builder 2. Runner
# Phase 1
FROM node:16-alpine as buider

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

RUN npm run build

# Phase 2
FROM nginx
EXPOSE 80
COPY --from=buider /app/build /usr/share/nginx/html
