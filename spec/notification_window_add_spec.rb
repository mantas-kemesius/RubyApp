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
      item.delete_notification(0)
    end
    it 'incremented' do
      expect { item.add_notification(notification) }
        .to change { item.size }
        .from(0).to(1)
    end
    it 'single item deleted' do
      item.add_notification(notification)
      item.delete_notification(0)
      expect(item.notifications[0]).to eq nil
    end
    it 'decremented' do
      item.add_notification(notification)
      expect { item.delete_notification(0) }
        .to change { item.size }
        .from(1).to(0)
    end
  end
end
