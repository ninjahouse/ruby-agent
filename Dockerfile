FROM ruby:2.3-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /test
WORKDIR /test
COPY Gemfile /test/Gemfile
COPY Gemfile.lock /test/Gemfile.lock
COPY . /test
