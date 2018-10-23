require 'spec_helper.rb'
describe Student do
  context 'when created' do
    let(:student) { described_class.new(123, 10, 'MIF', 'Informatika') }
    let(:student_bad) { described_class.new(-123, -10, 'MIF', 'Informatika') }

    it 'initial student number was set successful' do
      expect(student.s_id).to eq 123
    end

    it 'initial student group was set successful' do
      expect(student.group).to eq 10
    end

    it 'initial student faculty was set successful' do
      expect(student.faculty).to eq 'MIF'
    end

    it 'initial student number was set unsuccessful' do
      expect(student_bad.s_id).to eq nil
    end

    it 'initial student group was set unsuccessful' do
      expect(student_bad.group).to eq nil
    end
  end
end
