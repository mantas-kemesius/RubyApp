require 'rspec'
require_relative './../src/model/User'

RSpec.describe User do
  user = User.new('Petras', 'Petraitis', 0)
  it 'name should be Petras' do
    expect(user.name).to eq 'Petras'
  end

  it 'lastName should be Petraitis' do
    expect(user.last_name).to eq 'Petraitis'
  end

  it 'role should be ROLE_STUDENT' do
    expect(user.role).to eq 'ROLE_STUDENT'
  end

  it 'email should be empty string' do
    expect(user.email).to eq ''
  end

  it 'phone should be empty string' do
    expect(user.phone).to eq ''
  end
end
