require 'spec_helper'

RSpec.describe Teacher do
  teacher = described_class.new('t1610179', 'Vilniaus universitetas', 'mif')
  it 'initial data was set successful' do
    expect(teacher.id).to eq 't1610179'
    expect(teacher.university).to eq 'Vilniaus universitetas'
    expect(teacher.faculty).to eq 'mif'
  end
  it 'id number is correct format' do
    expect(teacher.id[0]).to eq 't'
    regex = /[t]\d{7}$/
    expect(!teacher.id[regex].nil?).to eq true
  end
end
