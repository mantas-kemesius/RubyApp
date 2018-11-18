require 'spec_helper'
require_relative '../lib/helpers/files_handler'

RSpec.describe(Email) do
  context 'when initializing data ' do
    let(:email) do
      described_class.new(
        'date' => '2018-11-13',
        'email_to' => 'jonas.jonaitis@gmail.com',
        'email_from' => 'petras.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      )
    end
    let(:email_not_valid) do
      described_class.new(
        'date' => 1,
        'email_to' => 2,
        'email_from' => 3,
        'title' => 4,
        'text' => 5
      )
    end

    it 'email_date set successfully' do
      expect(email.date).to eq '2018-11-13'
    end
    it 'email_to set successfully' do
      expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
    end
    it 'email_from set successfully' do
      expect(email.email_from).to eq 'petras.jonaitis@gmail.com'
    end
    it 'email_title set successfully' do
      expect(email.title).to eq 'Test title'
    end
    it 'email_text set successfully' do
      expect(email.text).to eq 'Test text'
    end
    it 'email_date set unsuccessfully' do
      expect(email_not_valid.date).to eq nil
    end
    it 'email_to set unsuccessfully' do
      expect(email_not_valid.email_to).to eq nil
    end
    it 'email_from set unsuccessfully' do
      expect(email_not_valid.email_from).to eq nil
    end
    it 'email_title set unsuccessfully' do
      expect(email_not_valid.title).to eq nil
    end
    it 'email_text set unsuccessfully' do
      expect(email_not_valid.text).to eq nil
    end
  end

  context 'with email ' do
    let(:email) do
      described_class.new(
        'date' => '2018-11-13',
        'email_to' => 'jonas.jonaitis@gmail.com',
        'email_from' => 'petras.jonaitis@gmail.com',
        'title' => 'Test title',
        'text' => 'Test text'
      )
    end
    let(:email_not_valid) do
      described_class.new(
        'date' => 1,
        'email_to' => 2,
        'email_from' => 3,
        'title' => 4,
        'text' => 5
      )
    end

    let(:temp_email_hash) do
      {
        date: '2018-11-13',
        email_to: 'jonas.jonaitis@gmail.com',
        email_from: 'petras.jonaitis@gmail.com',
        title: 'Test title',
        text: 'Test text'
      }
    end

    it 'hash date returned successfully' do
      expect(email.return_email).to eq temp_email_hash
    end

    it 'printed successfully' do
      string_email = "\n\n------------------\n\nFROM: " + email.email_from +
                     "\nTO: " + email.email_to + "\nDATE: " + email.date +
                     "\nTITLE: " + email.title + "\n\n" + email.text + "\n"
      expect { email.print_email }.to output(string_email).to_stdout
    end

    it 'field email_to changed successfully' do
      expect { email_not_valid.change_email_to('Naujas email_to') }
        .to change(email_not_valid, :email_to)
        .from(nil).to('Naujas email_to')
    end
    it 'field email_from changed successfully' do
      expect { email_not_valid.change_email_from('Naujas email_from') }
        .to change(email_not_valid, :email_from)
        .from(nil).to('Naujas email_from')
    end
    it 'field email_to changed unsuccessfully' do
      expect { email.change_email_to(2) }
        .not_to change(email, :email_to)
    end
    it 'field email_from changed unsuccessfully' do
      expect { email.change_email_from(2) }
        .not_to change(email, :email_from)
    end
    # it 'change successful title' do
    #   expect { email_not_valid.change_title('Naujas title') }
    #     .to change(email_not_valid, :title)
    #     .from(nil).to('Naujas title')
    # end
    # it 'change successful text' do
    #   expect { email_not_valid.change_text('Naujas text') }
    #     .to change(email_not_valid, :text)
    #     .from(nil).to('Naujas text')
    # end
    #
    # it 'change unsuccessful to' do
    #   email.change_email_to(1)
    #   expect(email.email_to).to eq 'jonas.jonaitis@gmail.com'
    # end
    # it 'change unsuccessful from' do
    #   email.change_email_from(2)
    #   expect(email.email_from).to eq 'petras.jonaitis@gmail.com'
    # end
    # it 'change unsuccessful title' do
    #   email.change_title(3)
    #   expect(email.title).to eq 'Test title'
    # end
    # it 'change unsuccessful text' do
    #   email.change_text(4)
    #   expect(email.text).to eq 'Test text'
    # end
  end
end
