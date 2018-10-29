require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'add item' do
    let(:item) do
      described_class.new
    end

    notification = Notification.new('2018-28-10', 'myTitle', 'myText', 'Tomas')
    it 'added successful' do
      item.add_notification(notification)
      expect(item.notifications[item.size - 1]).to eq notification
    end
    it 'incremented' do
      item.add_notification(notification)
      expect(item.size).to eq 1
    end
  end
end
