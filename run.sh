#!/usr/bin/env bash

bundle install

bundle exec mutant --include app/models --use rspec HomeController
bundle exec rspec
bundle exec rubocop
bundle exec reek
