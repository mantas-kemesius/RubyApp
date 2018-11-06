# Standart Matchers
    it 'initial student number was changed successful' do
      expect { student.change_sid(100) }
        .to change { student.s_id }
        .from(123).to(100)
    end
    
    it 'add with current date' do
      item.add_notification_now('title', 'text', 'sender')
      expect(item.notifications[
                 item.notifications.length - 1].date).to eq Date.today.to_s
    end
    
    it 'subject_name is not empty' do
      expect(temp_schedule2.subject_name).not_to eq nil
    end
    
    it 'phone number is less than 13 characters' do
      expect(user.phone.length).to be < 13
    end
    
    it 'date_month is of type String' do
      expect(temp_exams2.date_month).to be_instance_of(String)
    end
    
    it 'date_month is not of type Integer' do
      expect(temp_exams2.date_month).not_to be_instance_of(Integer)
    end
    
    expect { item.print_notifications }.to output(str).to_stdout
    


# Custom Matchers
