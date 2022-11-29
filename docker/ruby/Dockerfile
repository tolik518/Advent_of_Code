FROM ruby:3.0-alpine

RUN apk add build-base
RUN gem update --system

COPY docker/ruby/Gemfile docker/ruby/Gemfile.lock ./
RUN bundle install

CMD ruby
