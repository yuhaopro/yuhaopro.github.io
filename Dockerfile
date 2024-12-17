FROM node:22-alpine AS build
WORKDIR /dist/src/app
RUN npm cache clean --force
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
### STAGE 2:RUN ###
# Defining nginx image to be used
FROM nginx:stable AS ngi
# Copying compiled code and nginx config to different folder
# NOTE: This path may change according to your project's output folder
COPY --from=build /dist/src/app/dist/browser/ /usr/share/nginx/html
 COPY /nginx.conf  /etc/nginx/conf.d/
# Exposing a port, here it means that inside the container
# the app will be using Port 80 while running
EXPOSE 80
