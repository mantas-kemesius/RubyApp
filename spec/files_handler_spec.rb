require 'spec_helper'

RSpec.describe FilesHandler do
  file_handler = described_class.new
  data = ['data' => [1, 2, 3]]
  file_name = 'testFiles/testCreate'

  it 'File was created successfully' do
    file_handler.save_data(
      data,
      'testFiles/testCreate'
    )
    expect(file_handler.file_exist?(file_name)).to eq true
  end

  it 'File has right content' do
    expect(file_handler.load_data(file_name)).to eq data
  end

  it 'File was deleted successfully' do
    file_handler.delete_file(file_name)
    expect(file_handler.file_exist?(file_name)).to eq false
  end
end

RSpec.describe FilesHandler do
  file_handler = FilesHandler.new

  it 'user was found successfully by username' do
    temp_user1 = file_handler.get_user_by_username('s1612345', 'Users')
    temp_user = User.new('Petras', 'Petraitis', 1,
                         'petras@gmail.com', '862435384')

    expect(temp_user.name).to eq temp_user1.name
  end

  it 'user was not found by username ' do
    temp_user1 = file_handler.get_user_by_username('s161345', 'Users')
    temp_user = User.new('Petras', 'Petraitis', 1,
                         'petras@gmail.com', '862435384')
    expect(temp_user1.name).not_to eq temp_user.name
  end

  it 'user was found successfully by email' do
    temp_user1 = file_handler.get_user_by_email('petras@gmail.com', 'Users')
    temp_user = User.new('Petras', 'Petraitis', 1,
                         'petras@gmail.com', '862435384')

    expect(temp_user1.name).to eq temp_user.name
  end
end

RSpec.describe FilesHandler do
  file_handler = FilesHandler.new

  it 'emails sent to a user were found successfully' do
    emails = file_handler.get_received_emails('jonas@gmail.com',
                                              'Emails', 'Users')
    expect(emails[0].email_from).not_to eq ''
  end
end
