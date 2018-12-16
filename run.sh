#!/usr/bin/env bash

bundle install

bundle exec mutant --include app/models --use rspec HomeController SubjectController
bundle exec rspec
bundle exec rubocop
bundle exec reek
