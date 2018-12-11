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
    it 'searches existing title' do
      expect(Notification.existing_title('New Math Subjects')).to be true
    end
    it 'searches not existing title' do
      expect { Notification.existing_title('not existing') }
          .to raise_error('Not existing')
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
      notif = notifications(:Bronius_notif_1)
      Notification.del(notif.id)
      expect(Notification.exists?(notif.id)).to be false
    end
    # it 'deletes notification by teacher and title' do
    #   notif = notifications(:Bronius_notif_2)
    #   teacher = notif.teacher
    #   notif.delete_by_teacher_and_title(teacher)
    #   expect(Notification.exists?(notif.id)).to be false
    # end
  end

  context 'when printed' do
    let(:printed) do
      'I am teacher Bronius Rope' + "\n" + 'Very good teacher' \
        "\n" + 'Bronius Rope' + "\n" + '_________________________' \
        "\n" + 'I teach informatics' + "\n" + 'I am the best' + "\n" \
        'Bronius Rope' + "\n" + '_________________________' + "\n" + ''
    end
    let(:stub) do
      described_class
    end
    let(:holder) do
      []
    end

    it 'prints notification' do
      notif = notifications(:Tomas_notif)
      str = notif.title + "\n" + notif.text + "\n" + notif.sender + "\n"
      str += '_________________________' + "\n"
      expect { notif.print_notification }.to output(str).to_stdout
    end
    it 'print by title' do
      stub = described_class
      allow(stub).to receive(:find_by_sender).and_return([])
      expect { stub.print_by_sender('Bronius Rope') }
        .to output('Nothing to show' + "\n").to_stdout
    end
    it 'print by title with >= 2 notifications' do
      holder << notifications(:Bronius_notif_1)
      holder << notifications(:Bronius_notif_2)
      allow(stub).to receive(:find_by_title).and_return(holder)
      expect { stub.print_by_sender('Bronius Rope') }
        .to output(printed).to_stdout
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

  context 'when searching' do # Stub
    it 'find by sender' do
      notif = notifications(:Tomas_notif)
      expect(Notification.find_by_sender('Tomas Tomaitis')[0]).to eq notif
    end
    it 'find by sender with 2 or more notifications' do
      holder = []
      holder << notifications(:Bronius_notif_1)
      holder << notifications(:Bronius_notif_2)
      expect(Notification.find_by_sender('Bronius Rope')).to eq holder
    end
    it 'searches not existing title' do
      stub = described_class
      allow(stub).to receive(:exists?).and_return(false)
      expect { Notification.existing_title('not existing') }
        .to raise_error('Not existing')
    end
    it 'searches if same title exists' do
      stub = described_class
      allow(stub).to receive(:exists?).and_return(true)
      expect(stub.existing_title('New Math Subjects')).to be true
    end
  end
end
