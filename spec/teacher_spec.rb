require 'spec_helper'
describe Teacher do
  context 'when created' do
    let(:teacher) { described_class.new('t1610179', 'Vilniaus universitetas', 'mif') }
    
    it 'ID set correct' do
      expect(teacher.id).to eq 't1610179'
    end
    it 'university set correct' do
      expect(teacher.university).to eq 'Vilniaus universitetas'
    end
    it 'faculty set correct' do
      expect(teacher.faculty).to eq 'mif'
    end
    it 'faculty set correct' do
      expect(teacher.on_vacation).to eq false
    end
    it 'id number is correct format' do
      regex = /[t]\d{7}$/
      expect(!teacher.id[regex].nil?).to eq true
    end
    it 'teacher is on vacation' do
      teacher.goes_on_vacation(true)
      expect(teacher.on_vacation).to eq true
    end

    it 'teacher is on vacation' do
      teacher.goes_on_vacation(false)
      expect(teacher.on_vacation).to eq false
    end
  end
end

describe Teacher do
  context 'when created' do
    let(:teacher) { described_class.new('t1610179', 'Vilniaus universitetas', 'mif') }
  
    it 'has no subjects' do
      expect(teacher.subjects).to eq []
    end
    it 'can enter grade for student' do
      expect(teacher.enter_grade?).to eq true
    end
    it 'can edit grade for student' do
      expect(teacher.edit_grade?).to eq true
    end
    it 'can delete grade for student' do
      expect(teacher.delete_grade?).to eq true
    end
  end
end
