# Standart Matchers
    it 'initial student number was changed successful' do
      expect { student.change_sid(100) }
        .to change { student.s_id }
        .from(123).to(100)
    end
    
    
    
    
    


# Custom Matchers
