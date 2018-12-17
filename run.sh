#!/usr/bin/env bash

bundle install

bundle exec mutant --include app/models --use rspec TicketController UserController#modify_age UserController#delete HomeController TicketController#create TicketController#delete
bundle exec rspec
bundle exec rubocop
bundle exec reek
