require 'spec_helper'

RSpec.describe(NotificationWindow) do
  context 'when saved to file' do
    let(:window) do
      described_class.new
    end
    let(:path_to_save) { 'fakeDatabase/testFiles/Notifications_save.json' }
    let(:path_to_load) { 'fakeDatabase/testFiles/Notifications_load.json' }
    let(:notification1) do
      Notification.new('2018-10-28', 'myTitle', 'myText', 'Tomas')
    end
    let(:notification2) do
      Notification.new('2018-10-29', 'TestTitle', 'TestText', 'Tadas')
    end
    let(:save) do
      window.add_notification(notification1)
      window.add_notification(notification2)
      window.save_notifications(path_to_save)
    end
    let(:change_file) do
      window.delete_all
      window.save_notifications(path_to_save)
    end

    it 'files are same' do
      save
      expect(path_to_save).to be_identical_to_file(path_to_load)
      change_file
    end
    # it 'files are same' do
    #   save
    #   expect(FileUtils.compare_file(path_to_save, path_to_load)).to be true
    #   change_file
    # end
  end
end
