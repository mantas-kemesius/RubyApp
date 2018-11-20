# frozen_string_literal: true

require_relative '../test_helper'
# Notification minitests
class NotificationTest < ActiveSupport::TestCase
  def setup
    teacher = Teacher.create(name: 'Tom', last_name: 'Mac')
    @notification = teacher.notifications.build(title: 'New Subjects', text: 'Added new subjects')
  end

  test 'notification should be valid' do
    assert @notification.valid?
  end

  test 'title should be present' do
    @notification.title = ''
    assert_not @notification.valid?
  end
  test 'text should be present' do
    @notification.text = ''
    assert_not @notification.valid?
  end
end
