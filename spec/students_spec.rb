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
      expect { student.change_group(6) }
        .to change { student.group }
        .from(10).to(6)
    end

    it ' student group change unsuccessful' do
      expect { student.change_group(-15) }.not_to change { student.group }
    end

    it ' student change_faculty change successful' do
      expect { student.change_faculty('FF') }
        .to change { student.faculty }
        .from('MIF').to('FF')
    end

    it 'initial student study_program was set successful' do
      expect(student.study_program).to eq 'Informatika'
    end

    it ' student study_program change was successful' do
      expect { student.change_study_program('PS') }
        .to change { student.study_program }
        .from('Informatika').to('PS')
    end
  end
end
