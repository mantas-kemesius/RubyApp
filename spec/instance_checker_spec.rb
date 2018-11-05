require 'spec_helper'

describe InstanceChecker do
  context 'initial data ' do
    let(:instance_checker) do
      described_class.new
    end

    it 'instance_checker successfully then 10000' do
      expect(instance_checker.number_is_right?(10_000)).to eq true
    end
    it 'delete instance_checker successful then 10' do
      expect(instance_checker.number_is_right?(10)).to eq true
    end
    it 'delete instance_checker successful then not string' do
      expect(instance_checker.number_is_right?('')).to eq false
    end
    it 'delete instance_checker successful then not float' do
      expect(instance_checker.number_is_right?(1.3)).to eq false
    end
    it 'delete instance_checker successful then not nil' do
      expect(instance_checker.number_is_right?(nil)).to eq false
    end
    it 'valid to use' do
      expect(instance_checker.check_or_array(['valid'])).to eq true
    end
    it 'not valid for empty array' do
      expect(instance_checker.check_or_array([])).to eq true
    end
    it 'not valid for zero' do
      expect(instance_checker.check_or_array(0)).to eq false
    end
    it 'not valid for string' do
      expect(instance_checker.check_or_array('')).to eq false
    end
    it 'not valid for bool' do
      expect(instance_checker.check_or_array(true)).to eq false
    end
    it 'not valid for nil' do
      expect(instance_checker.check_or_array(nil)).to eq false
    end
    it 'text is valid' do
      expect(instance_checker.check_or_string_valid?('test')).to eq true
    end
    it 'text is not valid 2' do
      expect(instance_checker.check_or_string_valid?(nil)).to eq false
    end
    it 'text is not valid 3' do
      expect(instance_checker.check_or_string_valid?(true)).to eq false
    end
    it 'text is not valid 4' do
      expect(instance_checker.check_or_string_valid?(false)).to eq false
    end
    it 'text is not valid 5' do
      expect(instance_checker.check_or_string_valid?([])).to eq false
    end
    it 'text is not valid 6' do
      expect(instance_checker.check_or_string_valid?({})).to eq false
    end
  end
end
