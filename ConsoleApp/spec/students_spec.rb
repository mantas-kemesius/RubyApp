require 'spec_helper'
describe Student do
  context 'when changing' do
    let(:student) do
      described_class.new('s123', 10, 'Informatika', %w[Ruby Matematika])
    end

    it ' student group change was successful' do
      expect { student.change_group(6) }
        .to change { student.group }
        .from(10).to(6)
    end

    it ' student group change unsuccessful' do
      student.change_group(-15)
      expect(student.group).to be > -15
    end

    it ' student subject change successful' do
      student.add_subjects('Anglu')
      expect(student.subjects).to eq %w[Ruby Matematika Anglu]
    end

    it ' student subject change sizes successful' do
      student.add_subjects('Anglu')
      expect(student.subjects.size).to eq 3
    end

    it ' student subject change was  successful' do
      student.remove_first_subjects
      expect(student.subjects).to eq %w[Matematika]
    end

    it ' student subject remove was  successful' do
      student.remove_subjects('Matematika')
      expect(student.subjects).to eq %w[Ruby]
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
