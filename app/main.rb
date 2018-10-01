#!/usr/bin/ruby

require './src/model/User.rb'
require '../app/src/helpers/files_handler.rb'
require '../app/src/controllers/login_controller.rb'

# student credentials
username = 's1612346'
password = '123'

# lecturer credentials
username = 's1612345'
password = '123'


login_controller = LoginController.new
puts login_controller.login?(username, password)

# while(true)
# end