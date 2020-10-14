# docker-git-node-app <!-- omit in toc -->

[![GitHub](https://img.shields.io/github/license/QNimbus/docker-git-node-app?style=for-the-badge)](LICENSE)
![Maintenance](https://img.shields.io/maintenance/yes/2020?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/QNimbus/docker-git-node-app?style=for-the-badge)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/QNimbus/docker-git-node-app?style=for-the-badge)

## Table of contents <!-- omit in toc -->
- [Purpose](#purpose)
- [Build](#build)
- [Usage](#usage)
  - [With Docker](#with-docker)
  - [With Docker Compose](#with-docker-compose)
- [Examples](#examples)

## Purpose

This docker image allows you to quickly deploy a NodeJS app directly from a GIT repository.

## Build

`$ docker build --tag <organisation>/docker-git-node-app .`

## Usage

Configure the start of the NodeJS application using the `GIT_URL`, `NODE_VERSION`, `NPM_SCRIPT`, `USE_YARN` and `PORT` environment variables. `GIT_URL` is the URL of the git repository where the NodeJS app lives.

| VARIABLE       | DEFAULT VALUE                            | OPTIONAL |
| -------------- | ---------------------------------------- | -------- |
| `GIT_URL`      | https://github.com/heroku/node-js-sample | NO       |
| `NODE_VERSION` | `latest`                                 | YES      |
| `NPM_SCRIPT`   | `start`                                  | YES      |
| `USE_YARN`     | `yes`                                    | YES      |
| `PORT`         | `3000`                                   | YES      |

### With Docker

```
$ docker run --rm --detach --name http2mqtt \
  -p 3000:3000 \
  -e GIT_URL=https://github.com/QNimbus/http2mqtt \
  -e NODE_VERSION=10 \
  -e NPM_SCRIPT=start \
  -e USE_YARN=yes \
  -e PORT=3000 \
  `# The next environment variables are for the specific NodeJS app` \
  -e MQQT_HOST=mqtt://localhost:1883
  <organisation>/docker-git-node-app
```

### With Docker Compose

```
version: '3.7'
services:
  http2mqtt:
    container_name: http2mqtt
    image: <organisation>/docker-git-node-app
    build: .
    restart: unless-stopped
    logging:
      driver: 'json-file'
      options:
        max-size: '100k'
        max-file: '5'
        mode: 'non-blocking'
    ports:
      -3000:3000  
    environment:
      - GIT_URL=https://github.com/QNimbus/http2mqtt
      - NODE_VERSION=10
      - NPM_SCRIPT=start
      - USE_YARN=yes
      - PORT=3000
      - MQTT_HOST=mqtt://localhost:1883
```

To build the docker image run `$ docker-compose build`. To run the docker image using docker-compose run `$ docker-compose up -d`

## Examples
