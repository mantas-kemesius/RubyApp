require 'spec_helper'

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

  # Init serializer
  login_controller = LoginController.new
  login_controller.serializer(user)

  it 'Serializer makes user object from user array' do
    expect(login_controller.user.class).to eq User
  end

  it 'Serializer creates name from user array' do
    expect(login_controller.user.name).to eq user['name']
  end
  
  it 'Serializer creates last name from user array' do
    expect(login_controller.user.last_name).to eq user['lastName']
  end
  
  it 'Serializer creates phone from user array' do
    expect(login_controller.user.phone).to eq user['phone']
  end

  it 'Serializer creates email from user array' do
    expect(login_controller.user.email).to eq user['email']
  end
end