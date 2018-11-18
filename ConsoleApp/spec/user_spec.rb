require 'spec_helper.rb'

describe User do
  context 'when initializing user' do
    let(:user1) do
      described_class.new('username' => 'arnasrad',
                          'password' => 'slapta',
                          'name' => 'Arnas',
                          'last_name' => 'Radzevicius',
                          'role_id' => 0,
                          'email' => 'arnasrad@gmail.com',
                          'phone' => '860000000')
    end

    let(:user2) do
      described_class.new('username' => 'TomasMacikas',
                          'password' => 'slaptazodis',
                          'name' => 'Tomas',
                          'last_name' => 'Macikas',
                          'role_id' => 1,
                          'email' => '',
                          'phone' => '')
    end

    it 'username is set successfully' do
      expect(user1.username).to eq 'arnasrad'
    end
    it 'password is set successfully' do
      expect(user1.password).to eq 'slapta'
    end
    it 'name is set successfully' do
      expect(user1.name).to eq 'Arnas'
    end
    it 'last name is set successfully' do
      expect(user1.last_name).to eq 'Radzevicius'
    end
    it 'role is set successfully' do
      expect(user1.role).to eq 0
    end
    it 'email is set successfully' do
      expect(user1.email).to eq 'arnasrad@gmail.com'
    end
    it 'phone is set successfully' do
      expect(user1.phone).to eq '860000000'
    end
    it 'empty email is set successfully' do
      expect(user2.email).to eq ''
    end
    it 'empty phone is set successfully' do
      expect(user2.phone).to eq ''
    end

    # it 'phone number is less than 13 characters' do
    #   expect(user.phone.length).to be < 3
    # end
    #
    # it 'email is of type String' do
    #   expect(user.email).to be_instance_of(String)
    # end
    #
    # it 'phone is of type String' do
    #   expect(user.phone).to be_instance_of(String)
    # end
  end

  context 'when changing user data ' do
    let(:user1) do
      described_class.new('username' => 'arnasrad',
                          'password' => 'slapta',
                          'name' => 'Arnas',
                          'last_name' => 'Radzevicius',
                          'role_id' => 0,
                          'email' => 'arnasrad@gmail.com',
                          'phone' => '860000000')
    end

    let(:user2) do
      described_class.new('username' => 'TomasMacikas',
                          'password' => 'slaptazodis',
                          'name' => 'Tomas',
                          'last_name' => 'Macikas',
                          'role_id' => 1,
                          'email' => '',
                          'phone' => '')
    end

    it 'name change is successful' do
      expect { user1.change_name('Tomas') }
        .to change(user1, :name)
        .from('Arnas').to('Tomas')
    end

    it 'last_name change is successful' do
      expect { user1.change_last_name('Macikas') }
        .to change(user1, :last_name)
        .from('Radzevicius').to('Macikas')
    end

    it 'password change is successful' do
      expect { user1.change_password('slapta1') }
        .to change(user1, :password)
        .from('slapta').to('slapta1')
    end

    it 'email change is successful' do
      expect { user1.change_email('tomas.macikas@gmail.com') }
        .to change(user1, :email)
        .from('arnasrad@gmail.com').to('tomas.macikas@gmail.com')
    end

    it ' user email change was successful' do
      expect { user2.change_email('petras@gmail.com') }
        .to change(user2, :email)
        .from('').to('petras@gmail.com')
    end

    it ' user phone change was successful' do
      expect { user2.change_phone('8685123') }
        .to change(user2, :phone)
        .from('').to('8685123')
    end
  end

  context 'when getting user role string ' do
    let(:user1) do
      described_class.new('username' => 'arnasrad',
                          'password' => 'slapta',
                          'name' => 'Arnas',
                          'last_name' => 'Radzevicius',
                          'role_id' => 0,
                          'email' => 'arnasrad@gmail.com',
                          'phone' => '860000000')
    end
    let(:user2) do
      described_class.new('username' => 'TomasMacikas',
                          'password' => 'slaptazodis',
                          'name' => 'Tomas',
                          'last_name' => 'Macikas',
                          'role_id' => 1,
                          'email' => '',
                          'phone' => '')
    end

    it 'student role returned successfully' do
      expect(described_class.role_string(user1.role)).to eq 'ROLE_STUDENT'
    end

    it 'lecturer role returned successfully' do
      expect(described_class.role_string(user2.role)).to eq 'ROLE_LECTURER'
    end

    it 'non-existent role returned unsuccessfully' do
      expect(described_class.role_string(7)).to eq nil
    end
  end

  context 'when returning user hash' do
    let(:user1) do
      described_class.new('username' => 'arnasrad',
                          'password' => 'slapta',
                          'name' => 'Arnas',
                          'last_name' => 'Radzevicius',
                          'role_id' => 0,
                          'email' => 'arnasrad@gmail.com',
                          'phone' => '860000000')
    end

    let(:temp_user_hash) do
      {
        'username' => 'arnasrad',
        'password' => 'slapta',
        'name' => 'Arnas',
        'last_name' => 'Radzevicius',
        'role_id' => 0,
        'role' => 'ROLE_STUDENT',
        'email' => 'arnasrad@gmail.com',
        'phone' => '860000000'
      }
    end

    it ' return is successful' do
      expect(user1.return_user_hash).to eq(temp_user_hash)
    end
  end
end
