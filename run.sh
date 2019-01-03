#!/usr/bin/env bash

bundle install

bundle exec mutant --include app/models --use rspec TicketController MessageController MailController HomeController MessageController#delete SsubjectsController#fetch_all UserController#fetch_all UserController#modify_age UserController#modify_last_name UserController#delete UserController#register
bundle exec rspec
bundle exec rubocop
bundle exec reek
