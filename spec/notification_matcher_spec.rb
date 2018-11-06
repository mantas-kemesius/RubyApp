require 'spec_helper'

RSpec.describe Notification.new('2018-28-10', 'First', 'Hello', 'Admin') do
  it { is_expected.to have_attributes(:date => '2018-28-10') }
  it { is_expected.to have_attributes(:sender => 'Admin' ) }
  it { is_expected.to have_attributes(:title => 'First') }
  it { is_expected.to have_attributes(:text => 'Hello' ) }
end
