require 'spec_helper'

RSpec.describe(LoginController) do
  it 'Login should be unsuccessful' do
    login_controller = described_class.new
    expect(
      login_controller.login?('s1612345', '1223', 'testFiles/Users')
    ).to eq false
  end

  it 'Login should be successful' do
    login_controller = described_class.new
    expect(login_controller
       .login?('s1612345', '123', 'testFiles/Users')).to eq true
  end

  it 'Returned object should be created from User class' do
    login_controller = described_class.new
    login_controller.login?('s1612345', '123', 'testFiles/Users')
    expect(login_controller.user_obj.class).to eq User
  end
end
