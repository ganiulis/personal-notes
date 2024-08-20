FROM ruby:3-alpine

RUN apk add \
    g++ \
    libc-dev \
    make \
    ruby-dev

WORKDIR /app

COPY . /app

RUN bundle

CMD ["/usr/local/bundle/bin/jekyll", "serve", "--livereload"]
