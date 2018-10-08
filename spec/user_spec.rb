require 'spec_helper.rb'


RSpec.describe User do
  user = described_class.new('Petras', 'Petraitis', 0)
  temp_user = described_class.new('Petras', 'Petraitis', 0, 'email@email.com', '8623423423')
  it 'user name was setted successfuly' do
    expect(user.name).to eq 'Petras'
  end

  it 'user lastname was set successfuly' do
    expect(user.last_name).to eq 'Petraitis'
  end

  it 'user role was set successfuly' do
    expect(user.role).to eq 'ROLE_STUDENT'
  end

  it 'user email was set empty successfuly' do
    expect(user.email).to eq ''
  end

  it 'user phone was set empty successfuly' do
    expect(user.phone).to eq ''
  end

  it 'user email was set successfuly' do
    expect(temp_user.email).to eq 'email@email.com'
  end

  it 'user phone was set successfuly' do
    expect(temp_user.phone).to eq '8623423423'
  end
end


RSpec.describe User do
  userArray = {
      'username' => 's1612345',
      'name' => 'Petras',
      'lastName' => 'Petraitis',
      'role' => 'ROLE_LECTURER',
      'role_id' => 1,
      'email' => 'petras@gmail.com',
      'phone' => '862435384',
      'password' => '123'
  }
  # Init serializer
  user_model = described_class.new('Petras', 'Petraitis', 0)
  user_model.serializer(userArray)

  it 'Serializer makes user object from user array' do
    expect(user_model.user_obj.class).to eq User
  end

  it 'Serializer creates name from user array' do
    expect(user_model.user_obj.name).to eq user['name']
  end

  it 'Serializer creates last name from user array' do
    expect(user_model.user_obj.last_name).to eq user['lastName']
  end

  it 'Serializer creates phone from user array' do
    expect(user_model.user_obj.phone).to eq user['phone']
  end

  it 'Serializer creates email from user array' do
    expect(user_model.user_obj.email).to eq user['email']
  end
end