require 'spec_helper'

RSpec.describe Subject do
  subject = Subject.new('Ruby Programming', 'Agile Programming Ruby',
                        'Ruby.pdf', '5',
                        't1610179')
  it 'Subject name set correct' do
    expect(subject.name).to eq 'Ruby Programming'
  end
  it 'Subject description set correct' do
    expect(subject.description_text).to eq 'Agile Programming Ruby'
  end
  it 'Subject description file correct format' do
    regex = /[t]\d{7}$/
  end
end

RSpec.describe Subject do

end