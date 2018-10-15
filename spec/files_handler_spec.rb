require 'spec_helper'

RSpec.describe FilesHandler do
  context 'when created' do
    let(:file_handler) { described_class.new('testFiles/testCreate') }

    it 'File was created successfully' do
      expect(
        file_handler.save_data(
          ['data' => [1, 2, 3]]
        )
      ).to eq true
    end

    it 'File has right content' do
      expect(file_handler.load_data).to eq ['data' => [1, 2, 3]]
    end

    it 'File was deleted successfully' do
      expect(file_handler.delete_file).to eq true
    end

    it 'File exist' do
      expect(file_handler.file_exist?).to eq false
    end

    it 'name set' do
      expect(file_handler.file_name).to eq 'testFiles/testCreate'
    end
  end
end
