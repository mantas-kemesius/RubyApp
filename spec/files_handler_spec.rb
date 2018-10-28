require 'spec_helper'

RSpec.describe FilesHandler do
  context 'init' do
    let(:folder) { 'fakeDatabase/testFiles/tests.json' }
    let(:file_handler) { described_class.new(folder) }
    let(:data) { ['data' => [1, 2, 3]] }

    it 'created successfully' do
      expect(file_handler.save_data(data)).to eq true
    end

    it 'right content' do
      expect(file_handler.load_data).to eq data
    end

    it 'deleted succesfully' do
      expect(file_handler.delete_file).to eq true
    end
  end
end
