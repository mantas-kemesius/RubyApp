#!/usr/bin/ruby

require './src/model/User.rb'
require '../app/src/helpers/files_handler.rb'
require '../app/src/controllers/login_controller.rb'

def menu
  puts '1. Show pazymiai'
  puts '2. Show tvarkarasciai'
  puts '3. Show user info'
  puts '4. Show something more'
  puts 'exit: To exit from program'
  puts puts
end

# student credentials
# username = 's1612346'
# password = '123'
# lecturer credentials
username = 's1612345'
password = '123'

login_controller = LoginController.new
if login_controller.login?(username, password)
  loop do
    menu
    print 'Choose: '
    input = gets.chomp
    case input
    when '1'
      puts input
    when '2'
      puts input
    when '3'
      puts input
    when '4'
      puts input
    when 'exit'
      break
    end
  end
end