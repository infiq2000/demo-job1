### Build
FROM --platform=linux/amd64 node:16-alpine AS ionic
## Create app directory
WORKDIR /usr/src/app
## Install app dependencies
## A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./
RUN npm install -g ionic
RUN npm install -f
## Bundle app source
COPY . .
RUN ionic build
### Run 
FROM --platform=linux/amd64 nginx:stable
#COPY www /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=ionic  /usr/src/app/www /usr/share/nginx/html
