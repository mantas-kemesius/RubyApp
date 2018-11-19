require 'spec_helper'
describe Teacher do
  context 'when created' do
    let(:teacher) do
      described_class.new('t1610179', 'Vilniaus universitetas', 'mif')
    end

    it 'username set correct' do
      expect(teacher.username).to eq 't1610179'
    end

    it 'ID set correct start' do
      expect(teacher.username).to start_with 't'
    end

    it 'university set correct' do
      expect(teacher.university).to eq 'Vilniaus universitetas'
    end
    it 'faculty was set correct' do
      expect(teacher.faculty).to eq 'mif'
    end
    it 'username number is correct format' do
      regex = /[t]\d{7}$/
      expect(!teacher.username[regex].nil?).to eq true
    end

    context 'when on change' do
      let(:teacher) do
        described_class.new('t1610179', 'VU', 'mif')
      end

      it 'username changed correctly' do
        expect { teacher.change_username('t1610180') }
          .to change(teacher, :username)
          .from('t1610179').to('t1610180')
      end
      it 'university changed correctly' do
        expect { teacher.change_university('VGTU') }
          .to change(teacher, :university)
          .from('VU').to('VGTU')
      end
      it 'faculty changed correctly' do
        expect { teacher.change_faculty('vf') }.to change(
          teacher, :faculty
        ).from('mif').to('vf')
      end
    end

    context 'when teacher printed' do
      let(:teacher) do
        described_class.new('t1610179', 'VU', 'mif')
      end

      it 'prints one teacher' do
        s = teacher.username + "\n" + teacher.university + "\n"
        s += teacher.faculty + "\n"
        s += '__________________________________________________' + "\n"
        expect { teacher.print_teacher }.to output(s).to_stdout
      end
    end
  end
end
