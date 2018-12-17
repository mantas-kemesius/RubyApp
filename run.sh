#!/usr/bin/env bash

bundle install

bundle exec mutant --include app/models --use rspec TicketController HomeController UserController#fetch_all UserController#modify_age UserController#modify_last_name UserController#delete
bundle exec rspec
bundle exec rubocop
bundle exec reek
