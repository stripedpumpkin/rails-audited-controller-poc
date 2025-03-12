FROM ruby:2.7.6-bullseye AS base

WORKDIR /rails-audited-controller-poc

COPY Gemfile Gemfile.lock ./

RUN gem install bundler -v '2.2.27'
RUN bundle _2.2.27_ install

WORKDIR /rails-audited-controller-poc
