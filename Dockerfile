FROM selenium/node-chrome-debug:3.5.3-boron
LABEL authors=SeleniumHQ

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev ruby-full
RUN mkdir /test
WORKDIR /test
COPY Gemfile /test/Gemfile
COPY Gemfile.lock /test/Gemfile.lock
COPY . /test


USER seluser

#====================================
# Scripts to run Selenium Standalone
#====================================
COPY entry_point.sh /opt/bin/entry_point.sh

EXPOSE 4444
EXPOSE 5900



