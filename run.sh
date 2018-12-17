#!/usr/bin/env bash

bundle install

bundle exec mutant --include app/models --use rspec TicketController HomeController UserController#modify_age UserController#delete
bundle exec rspec
bundle exec rubocop
bundle exec reek
