require 'rspec'
require_relative './../src/controllers/login_controller'

RSpec.describe LoginController do
  login_controller = LoginController.new

  it 'Login should be unsuccessful' do
    expect(login_controller.login?('s1612345', '1223', 'testFiles/Users')).to eq false
  end

  it 'Login should be successful' do
    expect(login_controller.login?('s1612345', '123', 'testFiles/Users')).to eq true
  end

  it 'Returned object should be created from User class' do
    login_controller.login?('s1612345', '123', 'testFiles/Users')
    expect(login_controller.user.class).to eq User
  end
end
