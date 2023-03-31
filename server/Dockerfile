FROM node:16

WORKDIR /server

COPY package.json yarn.lock /server/

RUN yarn

COPY .env tsconfig.json .prettierrc /server/
COPY ./src /server/src

ENTRYPOINT [ "yarn", "start" ]

# docker build -f Dockerfile -t typing.worknsn
# docker run -dp 5000:5000 typing.worknsn