FROM node:lts-alpine

EXPOSE 8000

USER node

RUN mkdir -p /home/node/app && \
    apk add --update --no-cache git openssh

WORKDIR /home/node/app

COPY ./package.json .
RUN npm install

COPY . .

ENV BRANCH = "master"

CMD "git fetch && git checkout $BRANCH && git pull && npm install && npm start"
