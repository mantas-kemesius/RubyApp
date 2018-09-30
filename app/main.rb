#!/usr/bin/ruby

require './src/model/User.rb'
require '../app/src/Helpers/files_handler.rb'
require 'json'

# user = User.new('petras', 'asfa', 1)

# puts user.role
# puts JSON.parse(File.read('./fakeDatabase/Users.json'))

files_handler = FilesHandler.new(__dir__)

puts files_handler.load_data('Users')