FROM node:16.17.1-alpine as base
WORKDIR /code

FROM base as modules
COPY package*.json ./
run npm install

FROM base as prune
COPY package*.json ./
COPY --from=modules code/node_modules node_modules
run npm prune

FROM base as build
COPY --from=modules code/node_modules node_modules
COPY . .
run npx remix build

FROM base as prod
COPY --from=prune code/node_modules node_modules
COPY --from=build code/public public
COPY --from=build code/dist dist
CMD npx remix-serve dist