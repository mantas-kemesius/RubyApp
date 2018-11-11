# frozen_string_literal: true

# require 'spec_helper'
#
# describe Schedule do
#   context 'when created' do
#
#     let(:schedule) do
#       described_class.new(
#         {
#           'day' => '2',
#           'time' => '14:00'
#         }, '213', 'subject' => 'Programavimas' # , 'teacher' => 't1610179'
#       )
#     end
#
#     it 'print schedule' do
#       file = FilesHandler.new('fakeDatabase/testFiles/Schedule_load.json')
#       data = file.load_data.fetch('Schedule')
#       str = '##############################' + "\n" +  'TIME 08:30' + "\n"
#       expect { schedule.print_week(data) }.to output(str).to_stdout
#     end
#   end
# end
