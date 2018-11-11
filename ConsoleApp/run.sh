#!/usr/bin/env bash

bundle install

bundle exec mutant --include lib --use rspec LoginController Teacher Subject SubjectWindow Student User Email SubjectInfo FilesHandler Schedule Exams Grades NotificationWindow Notification
bundle exec rspec
bundle exec rubocop
bundle exec reek

