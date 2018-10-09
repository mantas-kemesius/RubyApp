#!/usr/bin/env bash

bundle install
bundle exec mutant --include lib --use rspec Teacher User Email Student Subject Serializer
bundle exec rspec
bundle exec rubocop
bundle exec reek

