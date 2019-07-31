FROM node:latest
WORKDIR /app/
COPY package.json /app/
RUN  npm install
RUN npm install -g  rendertron-middleware
COPY . .
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get -y install google-chrome-stable
CMD [ "npm","run" ,"start" ]
EXPOSE 3000
