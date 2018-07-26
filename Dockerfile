FROM selenium/node-chrome-debug:3.5.3-boron
LABEL authors=SeleniumHQ and NinjaHouse

USER seluser


RUN sudo apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /test
WORKDIR /test
COPY Gemfile /test/Gemfile
COPY Gemfile.lock /test/Gemfile.lock
COPY . /test

#====================================
# Scripts to run Selenium Standalone
#====================================
COPY entry_point.sh /opt/bin/entry_point.sh

EXPOSE 4444
EXPOSE 5900