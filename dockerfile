FROM node:20-alpine3.17

WORKDIR /usr/src/app
COPY . .
RUN npm install -g npm@9.8.1 \
    && npm init -y \
    && npm install  --save-dev webpack webpack-cli clean-webpack-plugin css-loader node-sass sass sass-loader style-loader postcss-loader postcss-preset-env babel-loader @babel/core @babel/preset-env mini-css-extract-plugin

EXPOSE 8090


