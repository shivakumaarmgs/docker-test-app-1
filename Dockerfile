FROM ruby:2.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN apt-get install -y netcat

RUN mkdir /myapp

WORKDIR /myapp

ADD Gemfile /myapp/Gemfile

RUN bundle install --jobs=4

ADD . /myapp
