FROM node:14.6

ARG PACKAGES="curl vim git bash"

RUN apt-get -y update && apt-get -y upgrade && apt-get -y install $PACKAGES

RUN npm i -g @nodosjs/cli@0.0.55

WORKDIR /app

COPY . /app

EXPOSE 8080
CMD nodos server -h '0.0.0.0'
