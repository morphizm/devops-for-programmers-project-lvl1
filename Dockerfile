FROM node:14.6

ARG PACKAGES="curl vim git bash"
# ARG PACKAGES="curl=7.52.1 vim=8.0 git=2.11.0 bash=4.4.12"
WORKDIR /app

RUN apt -y update && apt -y upgrade && apt -y install --no-install-recommends $PACKAGES && apt clean && rm -rf /var/lib/apt/lists/*

RUN npm i -g @nodosjs/cli@0.0.55

COPY . /app

RUN npm ci

EXPOSE 8080
CMD ["nodos", "server", "-h", "'0.0.0.0'"]
