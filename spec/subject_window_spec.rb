require 'spec_helper'

RSpec.describe(SubjectWindow) do
  context 'on subject added' do
    let(:window) do
      described_class.new
    end
    let(:item) do
      Subject.new('Ruby Programming', 'Agile Programming Ruby',
                  '5', 'Andrius Andraitis')
    end

    it 'same object' do
      window.add_subject(item)
      expect(window.subjects[
                 window.subjects.length - 1]).to eq item
      window.delete_subject(0)
    end

    it 'added successful to list' do
      window.add_subject(item)
      expect(window.subjects).not_to be_empty
    end

    it 'list size increased' do
      expect do
        window.add_subject(item)
      end.to change { window.subjects.length }.by(1)
    end

    it 'single item deleted' do
      window.add_subject(item)
      window.delete_subject(0)
      expect(window.subjects[0]).to eq nil
    end
  end
  context 'on load' do
    let(:window) do
      described_class.new
    end
    let(:load) do
      window.load_subjects(
        'fakeDatabase/testFiles/Subjects_load.json'
      )
    end

    it 'first item title correct' do
      load
      expect(window.subjects[0].title).to eq 'Ruby Programming'
    end
    it 'first item description correct' do
      load
      expect(window.subjects[0].description).to eq 'Agile Programming Ruby'
    end
    it 'first item teacher correct' do
      load
      expect(window.subjects[0].teacher).to eq 'Andrius Andraitis'
    end
    it 'first item credits correct' do
      load
      expect(window.subjects[0].credits).to eq '5'
    end
  end
  context 'saved to file' do
    let(:window) do
      described_class.new
    end
    let(:path_to_db) { 'fakeDatabase/testFiles/Subjects_save.json' }
    let(:item) do
      Subject.new('Discrete mathematics', 'Hardcoras', '7.5', 'Diciunas Jega')
    end
    let(:add) do
      window.add_subject(item)
      window.add_subject(item)
      window.save_subjects(
        'fakeDatabase/testFiles/Subjects_save.json'
      )
      window.delete_subject(0)
      window.delete_subject(0)
      window.load_subjects(
        'fakeDatabase/testFiles/Subjects_save.json'
      )
    end

    it 'title correct' do
      item.change_title('Mathematical analysis')
      add
      expect(window.subjects[1].title).to eq 'Mathematical analysis'
    end
    it 'description correct' do
      item.change_description('Very good')
      add
      expect(window.subjects[1].description).to eq 'Very good'
    end
    it 'credits correct' do
      item.change_credits('10')
      add
      expect(window.subjects[1].credits).to eq '10'
    end
    it 'teacher correct' do
      item.change_teacher('Plikusas Nesakysiu')
      add
      expect(window.subjects[1].teacher).to eq 'Plikusas Nesakysiu'
    end
  end
  context 'on print' do
    let(:window) do
      described_class.new
    end

    subject = Subject.new('Discrete mathematics', 'Hardcoras', '7.5',
                          'Diciunas Jega')
    it 'print notifications' do
      window.add_subject(subject)
      str = 'Discrete mathematics' + "\n" + 'Hardcoras' + "\n" + '7.5' + "\n"
      str += 'Diciunas Jega' + "\n"
      str += '__________________________________________________' + "\n"
      expect { window.print_subjects }.to output(str).to_stdout
    end
  end
end
