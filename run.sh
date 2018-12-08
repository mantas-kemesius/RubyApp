#!/usr/bin/env bash

bundle install

bundle exec mutant --include app/models --use rspec Teacher Notification User Student Subject Mail
bundle exec rspec
bundle exec rubocop
bundle exec reek
