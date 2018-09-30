#!/usr/bin/ruby

require './src/model/User.rb'
require '../app/src/Helpers/files_handler.rb'

files_handler = FilesHandler.new(__dir__)

puts files_handler.load_data('Users')