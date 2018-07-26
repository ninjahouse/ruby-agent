FROM freshbooks/ruby

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /test
WORKDIR /test
COPY Gemfile /test/Gemfile
COPY Gemfile.lock /test/Gemfile.lock
COPY . /test

ARG CHROME_VERSION="google-chrome-stable"

ENV DEBIAN_FRONTEND noninteractive

ENV buildDependencies wget unzip

RUN apt-get update -yqq && apt-get install -fyqq ${buildDependencies}

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qqy \
  && apt-get -qqy install \
    ${CHROME_VERSION:-google-chrome-stable} \
  && rm /etc/apt/sources.list.d/google-chrome.list \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
  && google-chrome --version

RUN  wget --no-check-certificate https://chromedriver.storage.googleapis.com/2.36/chromedriver_linux64.zip \
  && unzip chromedriver_linux64.zip \
  && rm chromedriver_linux64.zip \
  && mv -f chromedriver /usr/local/share/ \
  && chmod +x /usr/local/share/chromedriver \
  && ln -s /usr/local/share/chromedriver /usr/local/bin/chromedriver \
  && chromedriver -v