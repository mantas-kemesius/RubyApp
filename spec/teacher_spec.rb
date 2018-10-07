require 'spec_helper'

RSpec.describe Teacher do
  teacher = described_class.new("Vilius", "Vilniaus universitetas", "mif")
  it 'have name' do
    expect(teacher.name).to eq 'Vilius'
    expect(teacher.university).to eq 'Vilniaus universitetas'
    expect(teacher.faculty).to eq 'mif'
  end
end