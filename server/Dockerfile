FROM node:16

WORKDIR /server

COPY package.json yarn.lock ./

# docker image file version 맞추기 
RUN yarn

COPY .env index.ts tsconfig.json .prettierrc ./

ENTRYPOINT [ "yarn", "start" ]