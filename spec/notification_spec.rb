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
    it 'deletes notification by notification id' do
      notif = notifications(:Antanas_notif)
      # teacher = notif.teacher
      notif.del
      expect(Notification.exists?(notif.id)).to be false
    end
    it 'deletes notification by teacher and title' do
      notif = notifications(:Bronius_notif_2)
      teacher = notif.teacher
      notif.delete_by_teacher_and_title(teacher)
      expect(Notification.exists?(notif.id)).to be false
    end
  end

  context 'when printed' do
    it 'prints notification' do
      notif = notifications(:Tomas_notif)
      str = notif.title + "\n" + notif.text + "\n" + notif.sender + "\n"
      str += '_________________________' + "\n"
      expect { notif.print_notification }.to output(str).to_stdout
    end
  end

  context 'when changed' do
    it 'title was changed' do
      notif = notifications(:Antanas_notif)
      expect { notif.update_title('difTitle') }.to change(notif, :title)
        .from('New Math Subjects').to('difTitle')
    end
    it 'text was changed' do
      notif = notifications(:Antanas_notif)
      expect { notif.update_text('difText') }.to change(notif, :text)
        .from('Added Algebra 1,2').to('difText')
    end
    it 'sender was changed' do
      notif = notifications(:Bronius_notif_1)
      expect { notif.update_sender('difSender') }.to change(notif, :sender)
        .from('Bronius Rope').to('difSender')
    end
  end
end
