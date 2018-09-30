require 'rspec'
require_relative './../src/controllers/login_controller'

RSpec.describe LoginController do
  login_controller = LoginController.new
  it 'Login should be successful' do
    expect(login_controller.login?('s1612345', '123', 'testFiles/Users')).to eq true
  end

  it 'Login should be unsuccessful' do
    expect(login_controller.login?('s1612345', '1223', 'testFiles/Users')).to eq false
  end
end
