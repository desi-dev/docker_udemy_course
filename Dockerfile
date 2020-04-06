FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#will out put /app/build

FROM nginx:alpine
COPY --from=builder /app/build /usr/share/nginx/html


