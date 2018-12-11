# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe Teacher, type: :model do
  fixtures :teachers
  context 'when created' do
    it 'has none to begin with' do
      expect(Teacher.count).to eq teachers.size
    end
    it 'has one after adding one' do
      Teacher.create!
      expect(Teacher.count).to eq teachers.size + 1
    end
    it 'is in database' do
      user = User.create!(name: 'Tom', last_name: 'Mac', age: 1)
      teacher = Teacher.create(university: 'ktu')
      teacher.user = user
      expect(Teacher.find(teacher.id)).to be_present
    end
    it 'added successfully' do
      user = User.create!(name: 'Tom', last_name: 'Mac', age: 1)
      Teacher.add('ktu', user)
      expect(Teacher.exists?(user_id: user.id, university: 'ktu')).to be true
    end
  end

  context 'when checking users data' do
    it 'full name correct' do
      user = User.create!(name: 'Tom', last_name: 'Mac', age: 1)
      teacher = Teacher.create(university: 'ktu')
      teacher.user = user
      expect(teacher.full_name).to eq('Tom Mac')
    end
    it 'email correct' do
      teacher = teachers(:Bronius)
      expect(teacher.email).to eq('bronius.rope@gmail.com')
    end
  end

  context 'when deleted' do
    it 'same before delete' do
      expect(Teacher.count).to eq teachers.size
    end
    it 'count decreases' do
      teacher = teachers(:Tomas)
      teacher.destroy
      expect(Teacher.count).to eq teachers.size - 1
    end
    it 'deleted item does not exist' do
      teacher = teachers(:Tomas)
      Teacher.del(teacher.id)
      expect(Teacher.exists?(teacher.id)).to be false
    end
    it 'before delete exists' do
      teacher = teachers(:Tomas)
      expect(Teacher.exists?(teacher.id)).to be true
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
