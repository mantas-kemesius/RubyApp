require 'spec_helper'

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

RSpec.describe User do
  context 'to test getters and setters' do
    it 'getters are working correctly' do
      temp_user = User.new('Vardenis', 'Pavardenis', 0,
                           'vardenis.pavardenis@example.com', '+37051234567')
      expect(temp_user.get_name).to eq 'Vardenis'
      expect(temp_user.get_last_name).to eq 'Pavardenis'
      expect(temp_user.get_role_id).to eq 'ROLE_STUDENT'
      expect(temp_user.get_email).to eq 'vardenis.pavardenis@example.com'
      expect(temp_user.get_phone).to eq '+37051234567'
    end

    it 'setters are working correctly' do
      temp_user = User.new('', '', 0)
      temp_user.set_name('Vardenis')
      temp_user.set_last_name('Pavardenis')
      temp_user.set_role_id(0)
      temp_user.set_email('vardenis.pavardenis@example.com')
      temp_user.set_phone('+37051234567')

      expect(temp_user.get_name).to eq 'Vardenis'
      expect(temp_user.get_last_name).to eq 'Pavardenis'
      expect(temp_user.get_role_id).to eq 'ROLE_STUDENT'
      expect(temp_user.get_email).to eq 'vardenis.pavardenis@example.com'
      expect(temp_user.get_phone).to eq '+37051234567'
    end
  end
end
