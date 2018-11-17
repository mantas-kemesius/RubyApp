require 'spec_helper'

RSpec.describe(Notification) do
  context 'when object created' do
    let(:note) do
      described_class.new('2018-28-10', 'First', 'Hello', 'Admin')
    end

    it 'date set correctly' do
      expect(note.date).to eq '2018-28-10'
    end
    it 'date format correct' do
      regex = /^\d{4}[-]\d{2}[-]\d{2}$/
      expect(!note.date[regex].nil?).to eq true
    end
    it 'title set correctly' do
      expect(note.title).to eq 'First'
    end
    it 'text set correctly' do
      expect(note.text).to eq 'Hello'
    end
    it 'sender set correctly' do
      expect(note.sender).to eq 'Admin'
    end
    it 'notification printed' do
      s = note.date + "\n" + note.title + "\n" + note.text + "\n" + note.sender
      s += "\n" + '____________________________________________________' + "\n"
      expect { note.print_notification }.to output(s).to_stdout
    end
  end
end
