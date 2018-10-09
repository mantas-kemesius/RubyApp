RSpec.describe Serializer do
  user_array = {
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
  serializer = described_class.new
  user_obj = serializer.serializer(user_array)

  it 'Serializer makes user object from user array' do
    expect(user_obj.class).to eq User
  end

  it 'Serializer creates name from user array' do
    expect(user_obj.name).to eq user_array['name']
  end
  it 'Serializer creates last name from user array' do
    expect(user_obj.last_name).to eq user_array['lastName']
  end
  it 'Serializer creates phone from user array' do
    expect(user_obj.phone).to eq user_array['phone']
  end
  # it 'Serializer creates email from user array' do
  # expect(user_obj.email).to eq user_array['email']
  # end
end
