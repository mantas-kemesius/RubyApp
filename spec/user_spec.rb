require 'spec_helper.rb'

RSpec.describe User do
  user = User.new('Petras', 'Petraitis', 0)
  it 'initial data was set successful' do
    expect(user.name).to eq 'Petras'
    expect(user.last_name).to eq 'Petraitis'
    expect(user.role).to eq 'ROLE_STUDENT'
    expect(user.email).to eq ''
    expect(user.phone).to eq ''
  end

  it 'initial data was set unsuccessful' do
    expect(user.name).not_to eq 'Jonas'
    expect(user.last_name).not_to eq 'Jonaitis'
    expect(user.role).not_to eq 'ROLE_LECTURER'
    expect(user.email).not_to eq 'email@email.com'
    expect(user.phone).not_to eq '24330583245'
  end

  it 'initial data was set unsuccessful' do
    temp_user = User.new('Petras', 'Petraitis', 0, 'faultyEmail')
    expect(user.name).to eq 'Petras'
    expect(user.last_name).to eq 'Petraitis'
    expect(user.role).to eq 'ROLE_STUDENT'
    expect(user.email).not_to eq 'faultyEmail'
    expect(user.email).to eq ''
    expect(user.phone).to eq ''
  end
end
