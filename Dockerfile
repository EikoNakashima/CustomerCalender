FROM ruby:2.6.5

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs \
                       vim

RUN mkdir /CustomerCalender

WORKDIR /CustomerCalender

COPY Gemfile /CustomerCalender/Gemfile
COPY Gemfile.lock /CustomerCalender/Gemfile.lock

RUN gem install bundler
RUN bundle install

COPY . /CustomerCalender

RUN mkdir -p tmp/sockets
RUN mkdir -p tmp/pids