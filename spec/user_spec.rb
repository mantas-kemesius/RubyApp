require 'spec_helper.rb'

describe User do
  context 'when created' do
    let(:user) { described_class.new('Petras', 'Petraitis', 0) }
    let(:temp_user) do
      described_class.new('Petras', 'Petraitis', 0,
                          'email@email.com', '8623423423')
    end

    it 'user name was set successfully' do
      expect(user.name).to eq 'Petras'
    end
    it 'user last name was set successfully' do
      expect(user.last_name).to eq 'Petraitis'
    end
    it 'user email was set empty successfully' do
      expect(user.email).to eq ''
    end
    it 'user phone was set empty successfully' do
      expect(user.phone).to eq ''
    end
    it 'user email was set successfully' do
      expect(temp_user.email).to eq 'email@email.com'
    end
    it 'user phone was set successfully' do
      expect(temp_user.phone).to eq '8623423423'
    end

    it ' user email change was successful' do
      user.change_email('petras@gmail.com')
      expect(user.email).to eq('petras@gmail.com')
    end

    it 'user email phone was changed successfully' do
      user.change_phone('864987315')
      expect(user.phone).to eq('864987315')
    end

    it 'phone number is less than 13 characters' do
      expect(user.phone.length).to be < 3
    end
  end
end
