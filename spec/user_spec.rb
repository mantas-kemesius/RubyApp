# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe User, type: :model do
  fixtures :users
  context 'when checking fixtures' do
    it 'first object loaded' do
      users(:Tomas)
      expect(users(:Tomas).name).to eq('Tomas')
    end
  end

  context 'when created' do
    it 'has none to begin with' do
      expect(User.count).to eq users.size
    end
    it 'has one after adding one' do
      User.create!(age: 1)
      expect(User.count).to eq users.size + 1
    end
    it 'created successfully' do
      user = described_class.new(name: 'Tom', last_name: 'Mac')
      expect(user).to have_attributes(name: 'Tom', last_name: 'Mac')
    end
    it 'is in database' do
      user = described_class.create!(name: 'Tom', last_name: 'Mac', age: 1)
      expect(User.find(user.id)).to be_present
    end
    # TODO: create by function?
    # it 'search by name' do
    #   teacher = described_class.create!(name: 'Tom', last_name: 'Mac', age: 1)
    #   expect(Teacher.find_by_name(teacher.name)).to be_present
    # end
  end

  context 'when deleted' do
    it 'same before delete' do
      expect(User.count).to eq users.size
    end
    it 'count decreases' do
      user = users(:Tomas)
      user.destroy
      expect(User.count).to eq users.size - 1
    end
    # TODO: delete by function by id or name?
  end

  # context 'when printed' do
  #   let(:make_all_teacher_str) do
  #     str = ''
  #     users.each do |user|
  #       str += user.name + "\n" + user.last_name + "\n"
  #       str += '_________________________' + "\n"
  #     end
  #     str
  #   end
  #
  #   it 'test teachers printed' do
  #     user = users(:Tomas)
  #     # teacher_str = make_all_teacher_str
  #     str = user.name + "\n" + user.last_name + "\n"
  #     str += '_________________________' + "\n"
  #     expect { user.print_user }.to output(str).to_stdout
  #   end
  # end
end
