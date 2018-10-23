require 'spec_helper'

describe Email do
  context 'initial data is set successfully when' do
    let(:email) do
      described_class.new('jonas.jonaitis@gmail.com',
                          'Test email', 'Test email')
    end

    it 'user last name is set correctly' do
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
    end
    it 'user email is set correctly' do
      expect(email.title).to eq 'Test email'
    end
    it 'email to is set correctly' do
      expect(email.text).to eq 'Test email'
    end
  end
end
#
# describe Email do
#   context 'initial data is set unsuccessfully when' do
#     let(:user) do
#       User.new('Petras', 'Petraitis', 0, 'petras.petraitis@gmailcom')
#     end
#     let(:email) do
#       described_class.new(user, 'jonas.jonaitis@gmail.com', 'Test email')
#     end
#     it 'email format is incorrect (example@email.com)' do
#       expect(email.email_from.name).to eq 'Petras'
#     end
#     it 'email format is incorrect (example@email.com)' do
#       expect(email.email_from.last_name).to eq 'Petraitis'
#     end
#     it 'email format is incorrect (example@email.com)' do
#       expect(email.email_from.role).to eq 'ROLE_STUDENT'
#     end
#     it 'email format is incorrect (example@email.com)' do
#       expect(email.email_from.email).not_to eq 'petras.petraitis@gmail.com'
#     end
#     it 'email format is incorrect (example@email.com)' do
#       expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
#     end
#   end
# end

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

# RSpec.describe Email do
#   it 'sends email successfully' do
#     email = described_class.new('petras@gmail.com', 'jonas@gmail.com',
#                                 'Test', 'Test email')
#     email.send('Emails')
#   end
#
#   it 'receives email successfully' do
#   end
# end
