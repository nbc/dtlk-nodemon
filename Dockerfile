FROM node:12.6.0-stretch

# Install nodemon
RUN mkdir -p /usr/lib/node_modules \
    && yarn global add nodemon pm2 lerna \
        --no-progress \
        --global-folder /usr/lib \
    && yarn cache clean \
    && chown -R node:node /usr/lib/node_modules \
    && rm -rf ~/.node-gyp /tmp/*

# Prepare workdir
RUN mkdir /app \
    && chown node:node /app
WORKDIR /app

# Default command
CMD ["nodemon"]
