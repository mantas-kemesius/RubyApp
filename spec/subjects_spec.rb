require 'spec_helper'
describe Subject do
  context 'when created' do
    let(:item) do
      described_class.new('Ruby Programming', 'Agile Programming Ruby',
                          '5', 't1610179')
    end

    it 'Coordinating teacher ID correct format' do
      regex = /[t]\d{7}$/
      expect(!item.teacher[regex].nil?).to eq true
    end
    it 'Coordinating teacher set correct' do
      expect(item.teacher).to eq 't1610179'
    end
    it 'Credit number set correct' do
      expect(item.credits).to eq '5'
    end
    it 'subject printed' do
      s = item.title + "\n" + item.description + "\n" + item.credits + "\n"
      s += item.teacher
      s += "\n" + '__________________________________________________' + "\n"
      expect { item.print_subject }.to output(s).to_stdout
    end
    context 'on info change' do
      let(:item) do
        described_class.new('Ruby Programming', 'Agile Programming Ruby',
                            '5', 't1610179')
      end

      it 'title changed correctly' do
        expect { item.change_title('NewTitle') }
          .to change { item.title }
          .from('Ruby Programming').to('NewTitle')
      end
      it 'description changed correctly' do
        expect { item.change_description('newDesc') }
          .to change { item.description }
          .from('Agile Programming Ruby').to('newDesc')
      end
      it 'credits changed correctly' do
        expect { item.change_credits('10') }
          .to change { item.credits }
          .from('5').to('10')
      end
      it 'teacher change correctly' do
        expect { item.change_teacher('Plikusas') }
          .to change { item.teacher }
          .from('t1610179').to('Plikusas')
      end
    end
  end
end
