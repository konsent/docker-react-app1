# 빌드를 위한 단계(Builder stage)
FROM node:alpine as builder
WORKDIR /usr/src/app
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

# 구동을 위한 단계(Run stage)
FROM nginx
COPY --from=builder /usr/src/app/build /usr/share/nginx/html