#!/usr/bin/env bash

bundle install


bundle exec rspec
bundle exec rubocop
bundle exec reek
