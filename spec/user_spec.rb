require 'spec_helper.rb'

RSpec.describe User do
  user = described_class.new('Petras', 'Petraitis', 0)
  temp_user = described_class.new('Petras', 'Petraitis', 0,
                                  'email@email.com', '8623423423')
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
  user_email = 'petras@gmail.com'
  user = described_class.new('Petras', 'Petraitis', 0, user_email)
  it 'sends email successfully' do
    sent_successfully = user.send_email('jonas@gmail.com', 'Test email',
                                        'testing email functionality')
    expect(sent_successfully).to eq true
  end

  it 'gets user emails successfully' do
    emails = user.emails
    expect(emails[0].email_from).to eq user_email
  end

  it 'gets email count successfully' do
    file_handler.save_data(
        data,
        'testFiles/testCreate'
    )
    expect(file_handler.get_email_count('Emails')).to eq 4
  end
end