require 'spec_helper'
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
