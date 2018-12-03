# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe Subject, type: :model do
  fixtures :subjects, :teachers
  context 'when created' do
    it 'has none to begin with' do
      expect(Subject.count).to eq subjects.size
    end
    it 'has one after adding one' do
      teacher = Teacher.create(university: 'ktu')
      Subject.create!(teacher_id: teacher.id, name: 'Algebra', time: '8:00')
      expect(Subject.count).to eq teachers.size + 1
    end
    it 'is in database' do
      teacher = Teacher.create!(university: 'ktu')
      subject = Subject.create(name: 'Alge', time: '8', teacher_id: teacher.id)
      teacher.subject_ids = subject.id

      expect(Subject.find(subject.id)).to be_present
    end
    it 'added successfully' do
      teacher = Teacher.create(university: 'ktu')

      Subject.add('Alg', '8:00', teacher)
      bool = Subject.exists?(teacher_id: teacher.id, name: 'Alg', time: '8:00')
      expect(bool).to be true
    end
    it 'added successfully and checked' do
      teacher = Teacher.create(university: 'ktu')
      Subject.add('Algebra', '8:00', teacher)
      subject = Subject.last
      expect(teacher.subject_ids.last).to eq subject.id
    end
  end

  context 'when deleted' do
    it 'same before delete' do
      expect(Subject.count).to eq subjects.size
    end
    it 'count decreases' do
      subject = subjects(:Algebra)
      subject.destroy
      expect(Subject.count).to eq subjects.size - 1
    end
    it 'deleted item does not exist' do
      subject = subjects(:Komparchas)
      subject.destroy
      expect(Subject.exists?(subject.id)).to be false
    end
    it 'deletes item by user' do
      subject = subjects(:Komparchass)

      teacher = subject.teacher
      Subject.del(teacher)
      expect(Subject.exists?(subject.id)).to be false
    end
  end

  # context 'when printed' do
  #   let(:make_all_teacher_str) do
  #     str = ''
  #     teachers.each do |teach|
  #       str += teach.name + "\n" + teach.last_name + "\n"
  #       str += '_________________________' + "\n"
  #     end
  #     str
  #   end
  #
  #   it 'test teachers printed' do
  #     teacher = teachers(:Tomas)
  #     # teacher_str = make_all_teacher_str
  #     str = teacher.name + "\n" + teacher.last_name + "\n"
  #     str += '_________________________' + "\n"
  #     expect { teacher.print_teacher }.to output(str).to_stdout
  #   end
  # end
end
