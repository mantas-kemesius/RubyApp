require 'spec_helper'

RSpec.describe Email do
  context 'initial data is set successfully when' do
    user = User.new('Petras', 'Petraitis', 0, 'petras.petraitis@gmail.com')
    email = described_class.new(user, 'jonas.jonaitis@gmail.com', 'Test email')

    it 'user name is set correctly' do
      expect(email.email_from.name).to eq 'Petras'
    end
    it 'user last name is set correctly' do
      expect(email.email_from.last_name).to eq 'Petraitis'
    end
    it 'user role is set correctly' do
      expect(email.email_from.role).to eq 'ROLE_STUDENT'
    end
    it 'user email is set correctly' do
      expect(email.email_from.email).to eq 'petras.petraitis@gmail.com'
    end
    it 'email to is set correctly' do
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
    end
    it 'title is set correctly' do
      expect(email.title).to eq 'Test email'
    end
    it 'text is set correctly' do
      expect(email.text).to eq ''
    end
  end
end

RSpec.describe Email do
  context 'initial data is set unsuccessfully when' do
    user = User.new('Petras', 'Petraitis', 0, 'petras.petraitis@gmailcom')
    email = described_class.new(user, 'jonas.jonaitis@gmail.com', 'Test email')
    it 'email format is incorrect (example@email.com)' do

      expect(email.email_from.name).to eq 'Petras'
      expect(email.email_from.last_name).to eq 'Petraitis'
      expect(email.email_from.role).to eq 'ROLE_STUDENT'
      expect(email.email_from.email).not_to eq 'petras.petraitis@gmail.com'
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
      expect(email.title).to eq 'Test email'
      expect(email.text).to eq ''
    end
  end
end

RSpec.describe Email do
  it 'format validation works correctly' do
    expect(Email.a_valid_email?('user@gmail.com')).to eq true
    expect(Email.a_valid_email?('user1@inbox.lt')).to eq true
    expect(Email.a_valid_email?('user.2@yahoo.com')).to eq true
    expect(Email.a_valid_email?('us/er.2@yahoo.com')).to eq false
    expect(Email.a_valid_email?('user.2yahoocom')).to eq false
    expect(Email.a_valid_email?('us/er.2yahoo.com')).to eq false
  end
end

RSpec.describe Email do
  it 'sends email successfully' do
    email = described_class.new('petras@gmail.com', 'jonas@gmail.com',
                                'Test', 'Test email')
    email.send()
  end

  it 'receives email successfully' do

  end
end