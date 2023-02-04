FROM ruby:2.7.6

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN set -ex \
    && wget -qO- https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update \
    && apt-get install -y \
                 unzip \
                 nodejs \
                 locales \
                 locales-all \
                 vim-tiny \
                 --no-install-recommends \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g yarn

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ENV LANG ja_JP.UTF-8
ENV HISTFILE=/usr/src/app/.bash_history

EXPOSE 3000
ENV BINDING=0.0.0.0
