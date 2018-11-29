require_relative 'spec_helper'
RSpec.describe Teacher, :type => :model do
  fixtures :teachers
  context 'fixtures loaded' do

    it 'first object loaded' do
      teachers(:Tomas)
      expect(teachers(:Tomas).name).to eq('Tomas')
    end
    # it 'created successfully' do
    #   teacher = described_class.new({:name => 'Tom', :surname => 'Mac'})
    #   expect(teacher).to have_attributes(:name => 'Tom', :surname => 'Mac')
    #   puts 'valid'
    # end
  end
end
