require 'spec_helper'

RSpec.describe(Notification) do
  context 'with object changed' do
    let(:notification) do
      described_class.new('2018-28-10', 'First', 'Hello', 'Admin')
    end

    it 'date changed correctly' do
      expect { notification.change_date('2018-28-11') }
        .to change do
          notification.date
        end
        .from('2018-28-10').to('2018-28-11')
    end
    it 'title changed correctly' do
      expect { notification.change_title('newwTitle') }
        .to change do
          notification.title
        end
        .from('First').to('newwTitle')
    end
    it 'text changed correctly' do
      expect { notification.change_text('newwText') }
        .to change do
          notification.text
        end
        .from('Hello').to('newwText')
    end
    it 'sender change correctly' do
      expect { notification.change_sender('newwSender') }
        .to change do
          notification.sender
        end
        .from('Admin').to('newwSender')
    end
  end
end
