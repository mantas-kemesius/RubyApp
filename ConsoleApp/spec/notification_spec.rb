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

  context 'when compared' do
    let(:note) do
      described_class.new('2018-28-10', 'First', 'Hello', 'Admin')
    end
    let(:same_note) do
      described_class.new('2018-28-10', 'First', 'Hello', 'Admin')
    end
    let(:diff_date) do
      described_class.new('2018-28-11', 'First', 'Hello', 'Admin')
    end
    let(:diff_title) do
      described_class.new('2018-28-10', 'Second', 'Hello', 'Admin')
    end
    let(:diff_text) do
      described_class.new('2018-28-10', 'First', 'Hi', 'Admin')
    end
    let(:diff_sender) do
      described_class.new('2018-28-10', 'First', 'Hello', 'Tomas')
    end

    it 'is not same when date different' do
      expect(note == diff_date).to be false
    end
    it 'is not same when title different' do
      expect(note == diff_title).to be false
    end
    it 'is not same when text different' do
      expect(note == diff_text).to be false
    end
    it 'is not same when sender different' do
      expect(note == diff_sender).to be false
    end
    it 'is same' do
      expect(note == same_note).to be true
    end
  end
end
