FROM readytalk/nodejs

WORKDIR /app
ADD package.json /app/
RUN npm install
ADD . /app

CMD ["/nodejs/bin/node", "/app/app.js"]
#ENTRYPOINT ["/nodejs/bin/npm", "start"]
