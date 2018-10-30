require 'spec_helper'

RSpec.describe(Notification) do
  context 'object changed' do
    let(:notification) do
      described_class.new('2018-28-10', 'First', 'Hello', 'Admin')
    end

    it 'date changed correctly' do
      notification.change_date('2018-28-11')
      expect(notification.date).to eq '2018-28-11'
    end
    it 'title changed correctly' do
      notification.change_title('newwTitle')
      expect(notification.title).to eq 'newwTitle'
    end
    it 'text changed correctly' do
      notification.change_text('newwText')
      expect(notification.text).to eq 'newwText'
    end
    it 'sender change correctly' do
      notification.change_sender('newwSender')
      expect(notification.sender).to eq 'newwSender'
    end
  end
end
