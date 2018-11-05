require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'saved to file' do
    let(:window) do
      described_class.new
    end
    let(:path_to_db) { 'fakeDatabase/testFiles/Notifications_load.json' }
    let(:load) do
      window.load_notifications(
        'fakeDatabase/testFiles/Notifications_load.json'
      )
    end

    it 'first item date correct' do
      load
      expect(window.notifications[0].date).to eq '2018-10-28'
    end
    it 'first item title correct' do
      load
      expect(window.notifications[0].title).to eq 'myTitle'
    end
    it 'first item text correct' do
      load
      expect(window.notifications[0].text).to eq 'myText'
    end
    it 'first item sender correct' do
      load
      expect(window.notifications[0].sender).to eq 'John'
    end
  end
end
