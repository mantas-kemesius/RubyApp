require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'when loaded from file' do
    let(:window) do
      described_class.new
    end
    let(:path_to_db) { 'fakeDatabase/testFiles/Notifications_load.json' }
    let(:load) do
      window.load_notifications(
        'fakeDatabase/testFiles/Notifications_load.json'
      )
    end
    let(:notification1) do
      Notification.new('2018-10-28', 'myTitle', 'myText', 'Tomas')
    end
    let(:notification2) do
      Notification.new('2018-10-29', 'TestTitle', 'TestText', 'Tadas')
    end
    let(:items) do
      []
    end
    let(:add) do
      items << notification1
      items << notification2
    end

    it 'loaded items is same' do
      add
      load
      expect(window.notifications == items).to be true
    end
    it 'load deletes existing items' do
      window.add_notification(notification1)
      add
      load
      expect(window.notifications == items).to be true
    end
  end
end
