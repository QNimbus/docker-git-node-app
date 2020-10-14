FROM node

ENV NODE_VERSION stable
ENV NPM_SCRIPT start
ENV GIT_URL https://github.com/heroku/node-js-sample
ENV PORT 3000
ENV USE_YARN yes

COPY . /code

WORKDIR /code

RUN chmod +x /code/bootstrap.sh

RUN npm install -g n --silent --force
RUN npm install -g yarn --silent --force

ENTRYPOINT ["./bootstrap.sh"]
