require 'spec_helper'

RSpec.describe(LoginController) do
  let(:file_name) { 'testFiles/Users' }
  let(:login_controller1) do
    described_class.new(file_name, 's1612345', '1223')
  end

  # let(:file_handler) do
  #   FilesHandler.new(file_name)
  # end
  it 'Username' do
    expect(
      login_controller1.username
    ).to eq 's1612345'
  end
  it 'Password' do
    expect(
      login_controller1.password
    ).to eq '1223'
  end
  it 'File name' do
    expect(
      login_controller1.file_name
    ).to eq 'testFiles/Users'
  end
  # it '@file_handler' do
  #   expect(
  #     login_controller1.file_handler
  #   ).to file_handler
  # end
  # it 'Login should be unsuccessful' do
  #   expect(
  #     login_controller1.login?
  #   ).to eq false
  # end
  # let(:login_controller2) do
  #   described_class.new('testFiles/Users', 's1612345', '123')
  # end
  # it 'Login should be successful' do
  #   expect(login_controller2
  #      .login?).to eq true
  # end
end
