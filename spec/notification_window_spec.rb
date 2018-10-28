require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'on add' do
    let(:notification_window) do
      described_class.new
    end

    it 'added new notification' do
      expect(notification_window.add([], Notification.new('2018-28-10',
                                                          'First', 'Hello',
                                                          'Admin'))).to eq true
    end
    it 'view all notifications' do
      expect(notification_window.view_notifications).to eq true
    end
    it 'loads notifications from file' do
      expect(notification_window.load_notifications).to eq true
    end
    it 'delete notification' do
      expect(notification_window.delete_notification).to eq true
    end
  end
end
