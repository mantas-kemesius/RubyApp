# require_relative 'model/user'
require_relative './helpers/files_handler'
require_relative './model/email'
# require_relative 'controllers/login_controller'

def menu
  puts '1. Show pazymiai'
  puts '2. Show tvarkarasciai'
  puts '3. Show user info'
  puts 'exit: To exit from program'
end

# add example how to save data
# <<<<<<< JN-Schedule
# file = FilesHandler.new('fakeDatabase/Schedule.json')
# file.save_data(['data' => [1,2,3]])
# puts file.load_data['Schedule'][0]['date_day']
# file.delete_file
# =======
# file = FilesHandler.new('fakeDatabase/testFiles/data.json')
# file.save_data(['data' => [1, 2, 3]])
# puts file.load_data[0]['data'][0]
# file.delete_file
# >>>>>>> master

# email example
email = Email.new({
                    'to' => 'jonas.jonaitis@gmail.com',
                    'from' => 'jonas.jonaitis@gmail.com'
                  },
                  'Test email',
                  'Test email')
puts email.send_email
puts email.delete_email(0)

# puts File.dirname(__dir__)
# student credentials
# username = 's1612346'
# password = '123'
# lecturer credentials
# username = 's1612345'
# password = '123'
#
# login_controller = LoginController.new
# if login_controller.login?(username, password)
#   # getting user obj if login was successful
#   # user_obj = login_controller.user_obj
#   loop do
#     menu
#     print 'Choose: '
#     input = gets.chomp
#     case input
#     when '1'
#       puts input
#     when '2'
#       puts input
#     when '3'
#       puts input
#     when '4'
#       puts input
#     when 'exit'
#       break
#     end
#   end
# end