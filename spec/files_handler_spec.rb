require 'spec_helper'

RSpec.describe FilesHandler do
  file_handler = FilesHandler.new
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
