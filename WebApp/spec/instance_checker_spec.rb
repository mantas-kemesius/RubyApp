require 'spec_helper'

describe InstanceChecker do
  context 'initial data ' do
    let(:number1) { described_class.new(10_000) }
    let(:number2) { described_class.new(100) }
    let(:float1) { described_class.new(1.3) }
    let(:nil1) { described_class.new(nil) }
    let(:string1) { described_class.new('string') }
    let(:array1) { described_class.new([]) }
    let(:bool1) { described_class.new(true) }
    let(:bool2) { described_class.new(false) }

    it 'instance_checker successfully then 10000' do
      expect(number1.number_is_right?).to eq true
    end
    it 'delete instance_checker successful then 10' do
      expect(number2.number_is_right?).to eq true
    end
    it 'delete instance_checker successful then not string' do
      expect(string1.number_is_right?).to eq false
    end
    it 'delete instance_checker successful then not float' do
      expect(float1.number_is_right?).to eq false
    end
    it 'delete instance_checker successful then not nil' do
      expect(nil1.number_is_right?).to eq false
    end
    it 'valid to use' do
      expect(array1.check_or_array).to eq true
    end
    it 'not valid for zero' do
      expect(number1.check_or_array).to eq false
    end
    it 'not valid for string' do
      expect(string1.check_or_array).to eq false
    end
    it 'not valid for bool' do
      expect(bool1.check_or_array).to eq false
    end
    it 'not valid for nil' do
      expect(nil1.check_or_array).to eq false
    end
    it 'text is valid' do
      expect(string1.check_or_string_valid?).to eq true
    end
    it 'text is not valid 2' do
      expect(number2.check_or_string_valid?).to eq false
    end
    it 'text is not valid 3' do
      expect(bool1.check_or_string_valid?).to eq false
    end
    it 'text is not valid 4' do
      expect(bool2.check_or_string_valid?).to eq false
    end
    it 'text is not valid 5' do
      expect(array1.check_or_string_valid?).to eq false
    end
    it 'text is not valid 6' do
      expect(number1.check_or_string_valid?).to eq false
    end
  end
end
