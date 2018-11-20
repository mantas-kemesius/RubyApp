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
  end
  context 'on delete' do
    let(:window) do
      described_class.new
    end
    let(:item) do
      Subject.new('Ruby', 'Agile Programming Ruby',
                  '5', 'Andrius Kukulis')
    end
    let(:item2) do
      Subject.new('Ruby', 'Agile Programming Ruby',
                  '5', 'Andrius Andraitis')
    end
    let(:item3) do
      Subject.new('Ruby', 'Agile Programming Ruby',
                  '5', 'Andrius Andraitis')
    end
    let(:item4) do
      Subject.new('Rubyy', 'Agile Programming Ruby',
                  '5', 'Andrius Andraitis')
    end
    let(:add) do
      window.add_subject(item)
      window.add_subject(item2)
      window.add_subject(item3)
      window.add_subject(item4)
    end

    it 'single item deleted by position' do
      window.add_subject(item)
      window.delete_subject(0)
      expect(window.subjects[0]).to eq nil
    end
    it 'deleted by name' do
      add
      window.delete_by_title('Ruby')
      expect(window.subjects[0]).to eq item4
    end
    it 'deleted by name of teacher subjects' do
      add
      window.delete_by_title_by_teacher('Ruby', 'Andrius Andraitis')
      expect(window.subjects[1]).to eq item4
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
    let(:subject1) do
      Subject.new('Discrete mathematics', 'Hardcoras', '7.5',
                  'Diciunas Jega')
    end
    let(:subject2) do
      Subject.new('matanas', 'Hardcoras', '5',
                  'Plikusas Jega')
    end
    let(:add_two) do
      window.add_subject(subject1)
      window.add_subject(subject2)
    end

    str = 'Discrete mathematics' + "\n" + 'Hardcoras' + "\n" + '7.5' + "\n"
    str += 'Diciunas Jega' + "\n"
    str += '__________________________________________________' + "\n"

    subjects = 'Discrete mathematics, nera'
    it 'print notifications' do
      window.add_subject(subject1)
      expect { window.print_subjects }.to output(str).to_stdout
    end
    it 'print notifications by teacher' do
      add_two
      expect { window.print_subjects_by_teacher('Diciunas Jega') }.to output(
        str
      ).to_stdout
    end
    it 'prints notifications by student subjects' do
      add_two
      expect do
        window.print_subjects_by_student(subjects)
      end.to output(str).to_stdout
    end
  end
  context 'subject exists' do
    let(:window) do
      described_class.new
    end
    let(:subject1) do
      Subject.new('Discrete mathematics', 'Hardcoras', '7.5',
                  'Diciunas Jega')
    end
    let(:subject2) do
      Subject.new('matanas', 'Hardcoras', '5',
                  'Plikusas Jega')
    end
    let(:add_two) do
      window.add_subject(subject1)
      window.add_subject(subject2)
    end

    it 'matanas exists' do
      add_two
      expect(window.subject_exists?('matanas')).to be true
    end

    it 'not existing' do
      add_two
      expect(window.subject_exists?('ff')).to be false
    end
  end
end
