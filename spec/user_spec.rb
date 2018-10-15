require 'spec_helper.rb'

describe User do
  context 'when created' do
    let(:user) { described_class.new('Petras', 'Petraitis', 0) }
    let(:temp_user) do
      described_class.new('Petras', 'Petraitis', 0,
                          'email@email.com', '8623423423')
    end
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
  end
end
describe User do
  context 'when created' do
    let(:user) { described_class.new('Petras', 'Petraitis', 0) }
    let(:temp_user) do
      described_class.new('Petras', 'Petraitis', 0,
                          'email@email.com', '8623423423')
    end
    it 'user email was set successfuly' do
      expect(temp_user.email).to eq 'email@email.com'
    end
    it 'user phone was set successfuly' do
      expect(temp_user.phone).to eq '8623423423'
    end
  end
end
# run all tests at one time
describe User do
  context 'when created' do
    let(:file_handler) { FilesHandler.new }
    user_email = 'petras@gmail.com'
    email_file_name = 'testFiles\Emails'
    let(:user) { described_class.new('Petras', 'Petraitis', 0, user_email) }

    it 'sends email successfully' do
      # create temporary data file
      file_handler.save_data([], email_file_name)
      sent_successfully = user.send_email('jonas@gmail.com', 'Test email',
                                          'testing email functionality',
                                          email_file_name)
      expect(sent_successfully).to eq true
    end

    it 'gets user emails successfully' do
      email_arr = user.sent_emails(email_file_name)
      expect(email_arr[0].email_from).to eq user_email
    end

    it 'gets sent email count successfully' do
      expect(user.sent_email_count(email_file_name)).to eq 1
    end

    it 'gets received emails successfully' do
      expect(user.received_email_count(email_file_name)).to eq 0
      file_handler.delete_file(email_file_name)
    end
  end
end

RSpec.describe User do
  it 'user was found successfully by username' do
    temp_user1 = described_class.get_user_by_username('s1612345', 'Users')
    temp_user = described_class.new('Petras', 'Petraitis', 1,
                                    'petras@gmail.com', '862435384')

    expect(temp_user.name).to eq temp_user1.name
  end

  it 'user was not found by username ' do
    temp_user1 = described_class.get_user_by_username('s161345', 'Users')
    temp_user = described_class.new('Petras', 'Petraitis', 1,
                                    'petras@gmail.com', '862435384')
    expect(temp_user1.name).not_to eq temp_user.name
  end

  it 'user was found successfully by email' do
    temp_user1 = described_class.get_user_by_email('petras@gmail.com', 'Users')
    temp_user = described_class.new('Petras', 'Petraitis', 1,
                                    'petras@gmail.com', '862435384')

    expect(temp_user1.name).to eq temp_user.name
  end
end
