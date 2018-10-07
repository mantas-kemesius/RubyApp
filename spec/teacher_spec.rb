require 'spec_helper'

RSpec.describe Teacher do
  teacher = described_class.new
  it 'have name' do
    expect(teacher.name).to eq 'Tomas'
  end
end