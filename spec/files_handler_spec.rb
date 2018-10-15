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

# RSpec.describe FilesHandler do
#   file_handler = FilesHandler.new
#
#   it 'emails sent to a user were found successfully' do
#     emails = file_handler.get_received_emails('jonas@gmail.com',
#                                               'Emails', 'Users')
#     expect(emails[0].email_from).not_to eq ''
#   end
# end
