FROM node:alpine

WORKDIR /usr/app

COPY ./package.json .

RUN npm install

COPY ./ ./

RUN npm run build

EXPOSE 3100

CMD ["npm", "run", "start"]
