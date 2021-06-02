FROM node:14.6

WORKDIR /app
ARG PACKAGES="curl vim git bash"

RUN apt -y update && apt -y upgrade && apt -y install --no-install-recommends $PACKAGES && apt clean && rm -rf /var/lib/apt/lists/*

RUN npm i -g @nodosjs/cli@0.0.55

COPY package.json package.json
COPY package-lock.json package-lock.json

RUN npm ci

COPY . .

EXPOSE 8080
CMD ["nodos", "server", "-h", "'0.0.0.0'"]
