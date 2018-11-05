# require 'spec_helper'
#
# describe Schedule do
#   context 'when created' do
#     let(:temp_schedule3) do
#       described_class.new(
#         {
#           'day' => '2',
#           'time' => '14:00'
#         }, '213', 'subject' => 'Programavimas', 'teacher' => 't1610179'
#       )
#     end
#
#     it 'teacher_id is in correct format' do
#       regex = /[t]\d{7}$/
#       expect(!temp_schedule3.teacher_id[regex].nil?).to eq true
#     end
#   end
# end
