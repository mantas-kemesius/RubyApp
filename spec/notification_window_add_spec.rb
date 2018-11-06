require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'add item' do
    let(:item) do
      described_class.new
    end

    notification = Notification.new('2018-28-10', 'myTitle', 'myText', 'Tomas')
    it 'added successful' do
      item.add_notification(notification)
      expect(item.notifications[
                 item.notifications.length - 1]).to eq notification
      item.delete_notification(0)
    end

    it 'single item deleted' do
      item.add_notification(notification)
      item.delete_notification(0)
      expect(item.notifications[0]).to eq nil
    end
    it 'add with current date' do
      item.add_notification_now('title', 'text', 'sender')
      expect(item.notifications[
                 item.notifications.length - 1].date).to eq Date.today.to_s
    end
    it 'add with current title' do
      item.add_notification_now('title', 'text', 'sender')
      expect(item.notifications[
                 item.notifications.length - 1].title).to eq 'title'
    end
    it 'add current text correct' do
      item.add_notification_now('title', 'text', 'sender')
      expect(item.notifications[
                 item.notifications.length - 1].text).to eq 'text'
    end
    it 'add current sender correct' do
      item.add_notification_now('title', 'text', 'sender')
      expect(item.notifications[
                 item.notifications.length - 1].sender).to eq 'sender'
    end
  end
end
