# Build Phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
run yarn install
COPY . .
RUN yarn build

# Deploy Phase
# Copying the app/build folder
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

