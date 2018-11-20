require_relative 'rails_helper'

RSpec.describe Notification, :type => :model do
  context 'when object created' do

    it 'have title and text attributes' do
      note = described_class.new(title: 'First', text: 'Hello')
      expect(note).to have_attributes(title: 'First', text: 'Hello')
    end

    it 'is valid' do
      note = described_class.new(title: 'First', text: 'Hello')
      expect(note).to be_valid
    end

    it 'have title' do
      note = described_class.new(title: '', text: 'Hello')
      expect(note).not_to be_valid
    end

    it 'have text' do
      note = described_class.new(title: 'First', text: '')
      expect(note).not_to be_valid
    end
  end
  context 'when added to database' do
    let(:note) do
      described_class.new(title: 'First', text: 'Hello')
    end
    let(:add) do
      note.save
    end
    let(:delete) do
      notification = described_class.last
      notification.destroy
    end
    it 'title set correctly' do
      add
      notification = Notification.last
      expect(notification.title).to eq note.title
      delete
    end

    it 'text set correctly' do
      add
      notification = Notification.last
      expect(notification.text).to eq note.text
      delete
    end

    it 'notification printed' do
      note = described_class.new(title: 'First', text: '')
      s = "\n" + note.title + "\n" + note.text + "\n"
      s += '____________________________________________________' + "\n"
      expect { note.print_notification }.to output(s).to_stdout
    end
  end
  context 'when deleted from database' do
    let(:note) do
      described_class.new(title: 'First', text: 'Hello')
    end
    let(:add) do
      note.save
    end
    let(:delete) do
      notification = described_class.last
      notification.destroy
    end

    it 'does not exist' do
      notification = described_class.last
      add
      delete
      expect(note).not_to eq notification
    end
  end
end
