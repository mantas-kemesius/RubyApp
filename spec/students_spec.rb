require 'spec_helper'
describe Student do
  context 'when changing' do
    let(:student) do
      described_class.new(
        's_id' => 123,
        'group' => 10,
        'faculty' => 'MIF',
        'study_program' => 'Informatika',
        'subjects' => %w[Ruby Matematika],
        'active' => 1,
        'mode' => 'Dieninis'
      )
    end

    it ' student group change was successful' do
      student.change_group(6)
      expect(student.group).to eq 6
    end

    it ' student group change unsuccessful' do
      student.change_group(-15)
      expect(student.group).to eq 10
    end

    it ' student change_faculty change successful' do
      student.change_faculty('FF')
      expect(student.faculty).to eq 'FF'
    end

    it 'initial student study_program was set successful' do
      expect(student.study_program).to eq 'Informatika'
    end

    it ' student study_program change was successful' do
      student.change_study_program('PS')
      expect(student.study_program).to eq 'PS'
    end
  end
end
