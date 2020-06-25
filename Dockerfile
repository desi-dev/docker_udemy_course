FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#will out put /app/build

FROM nginx:alpine
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html


