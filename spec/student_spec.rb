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
describe Student do
  context 'when changing' do
    let(:student_group) { described_class.new(123, 5, 'MIF', 'Informatika') }

    it ' student group change was successful' do
      student_group.change_group(6)
      expect(student_group.group).to eq 6
    end

    it ' student group change unsuccessful' do
      student_group.change_group(-15)
      expect(student_group.group).to eq 5
    end

    it ' student change_faculty change successful' do
      student_group.change_faculty('FF')
      expect(student_group.faculty).to eq 'FF'
    end

    it 'initial student study_program was set successful' do
      expect(student_group.study_program).to eq 'Informatika'
    end

    it ' student study_program change was successful' do
      student_group.change_study_program('PS')
      expect(student_group.study_program).to eq 'PS'
    end
  end
end
