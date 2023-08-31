FROM node:latest

WORKDIR /app

COPY package*.json ./

COPY ./api-server ./

RUN npm install


EXPOSE 3000

CMD [ "node ." ]