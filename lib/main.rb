require_relative '../lib/model/user'
require_relative '../lib/helpers/files_handler'
require_relative 'controllers/login_controller'
#test
def menu
  puts '1. Show pazymiai'
  puts '2. Show tvarkarasciai'
  puts '3. Show user info'
  puts 'exit: To exit from program'
end

# student credentials
# username = 's1612346'
# password = '123'
# lecturer credentials
username = 's1612345'
password = '123'

login_controller = LoginController.new
if login_controller.login?(username, password)
  # getting user obj if login was successful
  # user_obj = login_controller.user_obj
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
