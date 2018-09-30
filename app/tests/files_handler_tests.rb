require 'rspec'
require_relative './../src/Helpers/files_handler'
require 'json'
RSpec.describe FilesHandler do
  file_handler = FilesHandler.new
  it 'Data from file should be: test' do
    expect(file_handler.load_data('testFiles/Test')['test']).to eq 'test'
  end
end
