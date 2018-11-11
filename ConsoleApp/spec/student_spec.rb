require 'spec_helper'
require 'spec_helper.rb'
require_relative '../lib/helpers/files_handler'

describe Student do
  context 'when created' do
    let(:student) do
      described_class.new('s123', 10, 'Informatika', %w[Ruby Matematika])
    end
    let(:student_bad) do
      described_class.new('s123', -10, 'Informatika', %w[Ruby Matematika])
    end

    it 'initial student number was set successful' do
      expect(student.s_id).to eq 's123'
    end

    it 'initial student number was changed successful' do
      expect { student.change_sid('s100') }
        .to change { student.s_id }
        .from('s123').to('s100')
    end

    it 'initial student group was set successful' do
      expect(student.group).to eq 10
    end

    it 'initial student group was set unsuccessful' do
      expect(student_bad.group).to eq nil
    end
  end
end
