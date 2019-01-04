#!/usr/bin/env bash

bundle install

bundle exec mutant --include app/models --use rspec LecturesController TicketController MessageController MailController ArticlesController UserController HomeController SubjectController UserController -j 1
bundle exec rspec
bundle exec rubocop
bundle exec reek
