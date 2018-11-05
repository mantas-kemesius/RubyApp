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
      # window.add_notification(notification)
      window.save_notifications('fakeDatabase/testFiles/Notifications.json')
      # window.append_notification(notification)
      window.delete_notification(0)
      # window.delete_notification(0)
      window.load_notifications('fakeDatabase/testFiles/Notifications.json')
    end

    it 'date correct' do
      notification.change_date('2018-28-11')
      add
      expect(window.notifications[0].date).to eq '2018-28-11'
    end
    it 'title correct' do
      notification.change_title 'newTitle'
      add
      expect(window.notifications[0].title).to eq 'newTitle'
    end
  end
end
