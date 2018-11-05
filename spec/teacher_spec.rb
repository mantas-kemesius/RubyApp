require 'spec_helper'
describe Teacher do
  context 'when created' do
    let(:teacher) do
      described_class.new('t1610179', 'Vilniaus universitetas', 'mif')
    end

    it 'ID set correct' do
      expect(teacher.id).to eq 't1610179'
    end
    it 'university set correct' do
      expect(teacher.university).to eq 'Vilniaus universitetas'
    end
    it 'faculty was set correct' do
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
      expect { teacher.goes_on_vacation(true) }
        .to change { teacher.on_vacation }
        .from(false).to(true)
    end
  end
end
