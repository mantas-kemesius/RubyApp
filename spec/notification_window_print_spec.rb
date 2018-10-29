require 'spec_helper'

RSpec.describe(NotificationWindow) do
  let(:item) do
    described_class.new
  end
  notification = Notification.new('2018-28-10', 'myTitle', 'myText', 'Tomas')
  it 'print notifications' do
    item.add_notification(notification)
    expect { item.print_notifications }.to output('done').to_stdout
  end
end