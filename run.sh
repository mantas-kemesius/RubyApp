#!/usr/bin/env bash

bundle install

bundle exec mutant --include app/models --use rspec UserController#modify_age HomeController TicketController#create TicketController#delete
bundle exec rspec
bundle exec rubocop
bundle exec reek
