require 'spec_helper'


RSpec.describe Teacher do
  teacher = described_class.new('t1610179', 'Vilniaus universitetas', 'mif')
  it 'ID set correct' do
    expect(teacher.id).to eq 't1610179'
  end
  it 'university set correct' do
    expect(teacher.university).to eq 'Vilniaus universitetas'
  end
  it 'faculty set correct' do
    expect(teacher.faculty).to eq 'mif'
  end
  it 'id number is correct format' do
    regex = /[t]\d{7}$/
    expect(!teacher.id[regex].nil?).to eq true
  end
  it 'teacher is on vacation' do
    teacher.goes_on_vacation(true)
    expect(teacher.on_vacation).to eq true
  end
end

RSpec.describe Teacher do
  teacher = described_class.new('t1610179', 'Vilniaus universitetas', 'mif')
  it 'have subjects' do
    expect(teacher.subjects).not_to eq nil
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
