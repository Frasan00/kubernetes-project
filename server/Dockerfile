FROM node:17
WORKDIR /usr/src/app
COPY *.json ./
RUN npm install
COPY /src .
RUN npm run build
EXPOSE 4000
CMD ["npm", "start"]