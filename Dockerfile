FROM ruby:3.0.1

WORKDIR "/usr/poc-mono-startup-rails-api-and-postgres"

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV RAILS_ENV='development'

ENV RACK_ENV='development'

COPY Gemfile .

COPY Gemfile.lock .

RUN bundle install

COPY . .