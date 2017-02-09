# FROM alpine:3.4
FROM node:7.5.0-alpine
MAINTAINER Jeff Dickey


# Install NodeJS and node-gyp deps
RUN apk --no-cache add g++
RUN apk --no-cache add gcc
RUN apk --no-cache add make
RUN apk --no-cache add bash
RUN apk --no-cache add gnupg
RUN apk --no-cache add paxctl
RUN apk --no-cache add python
RUN apk --no-cache add linux-headers

# Deploy application
RUN mkdir /srv/npm-register
COPY package.json /srv/npm-register/package.json
WORKDIR /srv/npm-register
RUN npm install
RUN npm install bcrypt

COPY . .

# Share storage volume
ENV NPM_REGISTER_FS_DIRECTORY /data
VOLUME /data

# Start application
EXPOSE 3000
ENV NODE_ENV production
CMD [ "npm", "start" ]
