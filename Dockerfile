FROM ruby:alpine3.13

MAINTAINER David Silveira <jdsilveira@gmail.com>

RUN apk add zsh
RUN apk --update add --virtual build_deps \
    build-base ruby-dev libc-dev linux-headers \
    openssl-dev postgresql-dev libxml2-dev libxslt-dev postgresql-libs gcc libc-dev
RUN mkdir /app

WORKDIR /app
RUN gem install bundler
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
# RUN apk del build_deps
EXPOSE 3000
CMD ["bash"]
