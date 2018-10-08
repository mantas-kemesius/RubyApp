require 'spec_helper.rb'

RSpec.describe User do
  user = User.new('Petras', 'Petraitis', 0)
  temp_user = User.new(
    'Petras', 'Petraitis', 0, 'email@email.com', '8623423423'
  )
  it 'user name was setted successfuly' do
    expect(user.name).to eq 'Petras'
  end

  it 'user lastname was setted successfuly' do
    expect(user.last_name).to eq 'Petraitis'
  end

  it 'user role was setted successfuly' do
    expect(user.role).to eq 'ROLE_STUDENT'
  end

  it 'user email was setted empty successfuly' do
    expect(user.email).to eq ''
  end

  it 'user phone was setted empty successfuly' do
    expect(user.phone).to eq ''
  end

  it 'user phone was setted successfuly' do
    expect(temp_user.email).to eq 'email@email.com'
  end

  it 'user phone was setted successfuly' do
    expect(temp_user.phone).to eq '8623423423'
  end
end
