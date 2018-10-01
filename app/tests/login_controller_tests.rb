require 'rspec'
require_relative './../src/controllers/login_controller'

RSpec.describe LoginController do
  user = {
    'username' => 's1612345',
    'name' => 'Petras',
    'lastName' => 'Petraitis',
    'role' => 'ROLE_LECTURER',
    'role_id' => 1,
    'email' => 'petras@gmail.com',
    'phone' => '862435384',
    'password' => '123'
  }

  it 'Login should be unsuccessful' do
    login_controller = LoginController.new
    expect(login_controller.login?('s1612345', '1223', 'testFiles/Users')).to eq false
  end

  it 'Login should be successful' do
    login_controller = LoginController.new
    expect(login_controller.login?('s1612345', '123', 'testFiles/Users')).to eq true
  end

  it 'Returned object should be created from User class' do
    login_controller = LoginController.new
    login_controller.login?('s1612345', '123', 'testFiles/Users')
    expect(login_controller.user.class).to eq User
  end

  it 'Serializer makes user object from array' do
    login_controller = LoginController.new
    login_controller.serializer(user)
    expect(login_controller.user.class).to eq User
    expect(login_controller.user.name).to eq user['name']
    expect(login_controller.user.last_name).to eq user['lastName']
    expect(login_controller.user.phone).to eq user['phone']
    expect(login_controller.user.email).to eq user['email']
  end
end
