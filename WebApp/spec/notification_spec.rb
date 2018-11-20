require_relative 'spec_helper'

RSpec.describe(Notification) do
  context 'object created' do

    it 'should have title and text attributes' do
      note = described_class.new(title: 'First', text: 'Hello')
      expect(note).to have_attributes(title: 'First', text: 'Hello')
    end

    it 'should be valid' do
      note = described_class.new(title: 'First', text: 'Hello')
      expect(note).to be_valid
    end

    # it 'title set correctly' do
    #   expect(notification).to eq 'First'
    # end
    # it 'text set correctly' do
    #   expect(note.text).to eq 'Hello'
    # end
    # it 'sender set correctly' do
    #   expect(note.sender).to eq 'Admin'
    # end
    # it 'notification printed' do
    #   s = note.date + "\n" + note.title + "\n" + note.text + "\n" + note.sender
    #   s += "\n" + '____________________________________________________' + "\n"
    #   expect { note.print_notification }.to output(s).to_stdout
    # end
  end
end
