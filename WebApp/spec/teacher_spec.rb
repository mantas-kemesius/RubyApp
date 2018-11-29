require_relative 'spec_helper'
RSpec.describe Teacher, type: :model do
  fixtures :teachers
  context 'when checking fixtures' do

    it 'first object loaded' do
      teachers(:Tomas)
      expect(teachers(:Tomas).name).to eq('Tomas')
    end
  end
  context 'when created' do
    it 'has none to begin with' do
      expect(Teacher.count).to eq teachers.size
    end
    it 'has one after adding one' do
      Teacher.create!(age: 1)
      expect(Teacher.count).to eq teachers.size+1
    end
    it 'empty again after another example' do
      expect(Teacher.count).to eq teachers.size
    end
    it 'created successfully' do
      teacher = described_class.new(name: 'Tom', last_name: 'Mac')
      expect(teacher).to have_attributes(name: 'Tom', last_name: 'Mac')
    end
    it 'is in database' do
      teacher = described_class.create!(name: 'Tom', last_name: 'Mac', age: 1)
      expect(Teacher.find(teacher.id)).to be_present
    end
    it 'search by name' do
      teacher = described_class.create!(name: 'Tom', last_name: 'Mac', age: 1)
      expect(Teacher.find_by_name(teacher.name)).to be_present
    end
  end
end
