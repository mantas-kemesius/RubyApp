# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe Student, type: :model do
  fixtures :students
  context 'when created' do
    it 'has none to begin with' do
      expect(Student.count).to eq students.size
    end
    it 'has one after adding one' do
      Student.create!(group: 2)
      expect(Student.count).to eq students.size + 1
    end
    it 'is in database' do
      user = User.create!(name: 'Arn', last_name: 'Rad', age: 20)
      student = Student.create(course: 'Informatics', group: 2)
      user.student = student
      expect(Student.find(student.id)).to be_present
    end
    it 'added successfully' do
      user = User.create!(name: 'Tom', last_name: 'Mac', age: 19)
      Student.add('Mathematics', '3', user)
      expect(Student.exists?(user_id: user.id, course: 'Mathematics',
                             group: '3')).to be true
    end
  end

  context 'when deleted' do
    it 'same before delete' do
      expect(Student.count).to eq students.size
    end
    it 'count decreases' do
      teacher = students(:Tomas)
      teacher.destroy
      expect(Student.count).to eq students.size - 1
    end
    it 'deleted item does not exist' do
      student = students(:Tomas)
      student.destroy
      expect(Student.exists?(student.id)).to be false
    end
    it 'deletes item by user' do
      student = students(:Tomas)
      user = student.user
      Student.del(user)
      expect(Student.exists?(student.id)).to be false
    end
    it 'deletes student by user' do
      student = students(:Arnas)
      user = student.user
      Student.delete(user)
      expect(Student.exists?(student.id)).to be true
    end
    it 'doesnt delete student by user' do
      student = students(:Tomas)
      user = student.user
      Student.delete(user)
      expect(Student.exists?(student.id)).to be false
    end
  end

  context 'when modified' do
    it 'student course set to new' do
      student = students(:Tomas)
      Student.change_course(student, 'Informatics Theory')
      expect(student.course).to eq 'Informatics Theory'
    end
    it 'student group set to new' do
      student = students(:Tomas)
      Student.change_group(student, 2)
      expect(student.group).to eq 2
    end
  end

  context 'when destroing' do
    it 'is not destroyed if not destroyable' do
      mocked_student = instance_spy('student', destroyable?: false)
      allow(Student).to receive(:find_by).and_return mocked_student
      Student.delete(5)
      expect(mocked_student).not_to have_received :destroy
    end

    it 'is destroyed if destroyable' do
      mocked_student = instance_spy('student', destroyable?: true)
      allow(Student).to receive(:find_by).and_return mocked_student
      Student.delete(5)
      expect(mocked_student).to have_received :destroy
    end
  end
end
