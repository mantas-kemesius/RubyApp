require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'saved to file' do
    let(:notification_window) do
      described_class.new
    end

    # notification = Notification.new('2018-28-10',
    # 'myTitle', 'myText', 'Tomas')
    # it 'date correct' do
    #   notification_window.save_notification(notification)
    #   loaded_notif = notification_window.load_notification
    #   expect(loaded_notif.date).to eq '2018-28-10'
    # end
    # it 'title correct' do
    #   loaded_notif = notification_window.load_notification
    #   expect(loaded_notif.title).to eq 'myTitle'
    # end
    # it 'text correct' do
    #   loaded_notif = notification_window.load_notification
    #   expect(loaded_notif.text).to eq 'myText'
    # end
    # it 'sender correct' do
    #   loaded_notif = notification_window.load_notification
    #   expect(loaded_notif.sender).to eq 'Tomas'
    # end
  end
end
