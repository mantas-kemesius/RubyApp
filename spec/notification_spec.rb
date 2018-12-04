# frozen_string_literal: true

require_relative 'rails_helper'

RSpec.describe Notification, type: :model do
  fixtures :notifications
  context 'when checking validation' do
    it 'have title and text attributes' do
      note = described_class.create(title: 'First',
                                    text: 'Hello', sender: 'Tomas')
      expect(note).to have_attributes(title: 'First',
                                      text: 'Hello', sender: 'Tomas')
    end

    it 'is valid' do
      note = described_class.create(title: 'First',
                                    text: 'Hello', sender: 'Tomas')
      expect(note).to be_valid
    end

    it 'have title' do
      note = described_class.create(title: '', text: 'Hello', sender: 'Tomas')
      expect(note).not_to be_valid
    end

    it 'have text' do
      note = described_class.create(title: 'First', text: '', sender: 'Tomas')
      expect(note).not_to be_valid
    end

    it 'have sender' do
      note = described_class.create(title: 'First', text: 'Hello', sender: '')
      expect(note).not_to be_valid
    end
  end

  context 'when checking sender' do
    it 'sender correct' do
      teacher = instance_double('Teacher')
      allow(teacher).to receive(:full_name).and_return('Tom Mac')
      note = described_class.add('First', 'Hello', teacher)

      expect(note.sender).to eq('Tom Mac')
    end
  end

  context 'when created' do
    it 'added successfully' do # Stub method
      teacher = instance_double('Teacher', full_name: 'Tom Mac')
      Notification.add('First', 'Hello', teacher)
      expect(Notification.exists?(title: 'First',
                                  text: 'Hello', sender: 'Tom Mac')).to be true
    end
    it 'full name should be received from teacher' do # Mock
      teacher = instance_spy('Teacher', full_name: 'Tom Mac')
      Notification.add('First', 'Hello', teacher)
      expect(teacher).to have_received(:full_name)
    end
  end

  context 'when deleted' do
    it 'same before delete' do
      expect(Notification.count).to eq notifications.size
    end
    it 'count decreases' do
      notif = notifications(:Tomas_notif)
      notif.destroy
      expect(Notification.count).to eq notifications.size - 1
    end
  end
end
