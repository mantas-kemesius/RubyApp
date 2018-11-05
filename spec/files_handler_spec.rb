require 'spec_helper'

RSpec.describe FilesHandler do
  context 'init' do
    let(:folder) { 'fakeDatabase/testFiles/tests.json' }
    let(:file_handler) { described_class.new(folder) }
    let(:data) { [1, 2, 3] }

    it 'created successfully' do
      expect(file_handler.save_data(data)).to eq true
    end

    it 'right content' do
      file_handler.save_data(data)
      expect(file_handler.load_data).to eq data
    end

    it 'right load content' do
      file_handler.delete_file
      file_handler.save_data(data)
      data.push(2)
      expect(file_handler.load_data).to eq [1, 2, 3]
    end

    it 'right load contents' do
      file_handler.save_data(data)
      fh = open folder
      content = fh.read
      fh.close
      expect(content).to eq "[\n  1,\n  2,\n  3\n]"
    end

    it 'deleted succesfully' do
      expect(file_handler.delete_file).to eq true
    end
  end
end
