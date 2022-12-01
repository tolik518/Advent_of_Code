FROM ruby:3.0-alpine

ARG uid
ARG user

RUN adduser -D -u $uid $user

RUN apk add build-base
RUN gem update --system

COPY docker/ruby/Gemfile docker/ruby/Gemfile.lock ./
RUN bundle install

USER $user

CMD ruby
