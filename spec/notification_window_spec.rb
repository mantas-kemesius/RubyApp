require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'saved to file' do
    let(:window) do
      described_class.new
    end
    let(:path_to_db) { 'fakeDatabase/testFiles/Notifications.json' }
    let(:notification) do
      Notification.new('2018-28-10', 'myTitle', 'myText', 'Tomas')
    end
    let(:add) do
      window.add_notification(notification)
      window.save_notifications('fakeDatabase/testFiles/Notifications.json')
      window.delete_notification(0)
      window.load_notifications('fakeDatabase/testFiles/Notifications.json')
    end

    it 'text correct' do
      notification.change_text 'newText'
      add
      expect(window.notifications[0].text).to eq 'newText'
    end
    it 'sender correct' do
      notification.change_sender 'John'
      add
      expect(window.notifications[0].sender).to eq 'John'
    end
  end
end
