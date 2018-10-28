#!/usr/bin/env bash

cp rubocop.dist.yml .rubocop.yml
bundle install
bundle exec mutant --include lib --use rspec LoginController Teacher Subject Student User Email EmailInfo SubjectInfo
bundle exec rspec
bundle exec rubocop
bundle exec reek

