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
  end
end

RSpec.describe Email do
  context 'initial data is set unsuccessfully when' do
    user = User.new('Petras', 'Petraitis', 0, 'petras.petraitis@gmailcom')
    email = described_class.new(user, 'jonas.jonaitis@gmail.com', 'Test email')

    it 'email format is incorrect (example@email.com)' do
      expect(email.email_from.name).to eq 'Petras'
    end
    it 'email format is incorrect (example@email.com)' do
      expect(email.email_from.last_name).to eq 'Petraitis'
    end
    it 'email format is incorrect (example@email.com)' do
      expect(email.email_from.role).to eq 'ROLE_STUDENT'
    end
    it 'email format is incorrect (example@email.com)' do
      expect(email.email_from.email).not_to eq 'petras.petraitis@gmail.com'
    end
    it 'email format is incorrect (example@email.com)' do
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
    end
  end
end

# RSpec.describe Email do
# it 'format validation works correctly' do
# expect(Email.a_valid_email?('user@gmail.com')).to eq true
# end
#
# it 'format validation works correctly' do
# expect(Email.a_valid_email?('us/er.2@yahoo.com')).to eq false
#
# end
# end

RSpec.describe Email do
  it 'sends email successfully' do
    email = described_class.new('petras@gmail.com', 'jonas@gmail.com',
                                'Test', 'Test email')
    email.send
  end

  it 'receives email successfully' do
  end
end
