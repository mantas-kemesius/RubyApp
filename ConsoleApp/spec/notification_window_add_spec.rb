require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'with add item' do
    let(:item) do
      described_class.new
    end

    notification = Notification.new('2018-12-10', 'myTitle', 'myText', 'Tomas')
    it 'same object' do
      item.add_notification(notification)
      expect(item.notifications[
                 item.notifications.length - 1]).to eq notification
      item.delete_notification(0)
    end

    it 'added successful to list' do
      item.add_notification(notification)
      expect(item.notifications).not_to be_empty
    end

    it 'list size increased' do
      expect do
        item.add_notification(
          notification
        )
      end.to change { item.notifications.length }.by(1)
    end

    it 'date format correct ' do
      item.add_notification(notification)
      expect(item.notifications[
                 item.notifications.length - 1].date).to match(
                   /\d{4}-([0]\d|[1][012])-[0123]\d/
                 )
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
