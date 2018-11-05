require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'saved to file' do
    let(:window) do
      described_class.new
    end
    let(:path_to_db) { 'fakeDatabase/testFiles/Notifications_save.json' }
    let(:notification) do
      Notification.new('2018-10-28', 'myTitle', 'myText', 'Tomas')
    end
    let(:add) do
      window.add_notification(notification)
      window.add_notification(notification)
      window.save_notifications(
        'fakeDatabase/testFiles/Notifications_save.json'
      )
      window.delete_notification(0)
      window.delete_notification(0)
      window.load_notifications(
        'fakeDatabase/testFiles/Notifications_save.json'
      )
    end

    it 'date correct' do
      add
      expect(window.notifications[1].date).to eq '2018-10-28'
    end
    it 'title correct' do
      add
      expect(window.notifications[1].title).to eq 'myTitle'
    end
    it 'text correct' do
      add
      expect(window.notifications[1].text).to eq 'myText'
    end
    it 'sender correct' do
      add
      expect(window.notifications[1].sender).to eq 'Tomas'
    end
  end
end
