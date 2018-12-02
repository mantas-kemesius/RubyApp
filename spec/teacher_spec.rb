# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe Teacher, type: :model do
  fixtures :teachers

  context 'when created' do
    it 'has none to begin with' do
      expect(Teacher.count).to eq teachers.size
    end
    it 'has one after adding one' do
      Teacher.create!()
      expect(Teacher.count).to eq teachers.size + 1
    end
    it 'is in database' do
      user = User.create!(name: 'Tom', last_name: 'Mac', age: 1)
      teacher = Teacher.create(university: 'ktu')
      user.teacher = teacher
      expect(Teacher.find(teacher.id)).to be_present
    end
    # it 'search by name' do
    #   teacher = described_class.create!(name: 'Tom', last_name: 'Mac', age: 1)
    #   expect(Teacher.find_by_name(teacher.name)).to be_present
    # end
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
    # TODO: delete by function by id or name?
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
