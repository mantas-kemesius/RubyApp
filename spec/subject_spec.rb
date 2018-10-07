require 'spec_helper'

RSpec.describe Subject do
  subject = described_class.new('Ruby Programming')
  it 'initial data was set successful' do
    expect(subject.name).to eq 'Ruby Programming'
  end
end