require 'spec_helper'

RSpec.describe(NotificationWindow) do
  let(:item) do
    described_class.new
  end

  notification = Notification.new('2018-28-10', 'myTitle', 'myText', 'Tomas')
  it 'print notifications' do
    item.add_notification(notification)
    str = '2018-28-10' + "\n" + 'myTitle' + "\n" + 'myText' + "\n" + 'Tomas'
    str += + "\n" + '____________________________________________________'
    str += "\n"
    expect { item.print_notifications }.to output(str).to_stdout
  end
end
