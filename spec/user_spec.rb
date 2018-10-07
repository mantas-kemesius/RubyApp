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

  context 'to test getters and setters' do
    it 'getters are working correctly' do
      tempUser = User.new('Vardenis', 'Pavardenis', 0,
                          'vardenis.pavardenis@example.com', '+37051234567')
      expect(tempUser.getName).to eq 'Vardenis'
      expect(tempUser.getLastName).to eq 'Pavardenis'
      expect(tempUser.getRoleID).to eq 'ROLE_STUDENT'
      expect(tempUser.getEmail).to eq 'vardenis.pavardenis@example.com'
      expect(tempUser.getPhone).to eq '+37051234567'
    end

    it 'setters are working correctly' do
      tempUser = User.new('', '', 0)
      tempUser.setName('Vardenis')
      tempUser.setLastName('Pavardenis')
      tempUser.setRoleID(0)
      tempUser.setEmail('vardenis.pavardenis@example.com')
      tempUser.setPhone('+37051234567')

      expect(tempUser.getName).to eq 'Vardenis'
      expect(tempUser.getLastName).to eq 'Pavardenis'
      expect(tempUser.getRoleID).to eq 'ROLE_STUDENT'
      expect(tempUser.getEmail).to eq 'vardenis.pavardenis@example.com'
      expect(tempUser.getPhone).to eq '+37051234567'
    end
  end
end
