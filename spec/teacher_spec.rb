# frozen_string_literal: true

require_relative 'spec_helper'
RSpec.describe Teacher, type: :model do
  fixtures :teachers
  context 'when created' do
    it 'has none to begin with' do
      expect(Teacher.count).to eq teachers.size
    end
    it 'has one after adding one' do
      Teacher.create!
      expect(Teacher.count).to eq teachers.size + 1
    end
    it 'is in database' do
      user = User.create!(name: 'Tom', last_name: 'Mac', age: 1)
      teacher = Teacher.create(university: 'ktu')
      teacher.user = user
      expect(Teacher.find(teacher.id)).to be_present
    end
    it 'added successfully' do
      user = User.create!(name: 'Tom', last_name: 'Mac', age: 1)
      Teacher.add('ktu', user)
      expect(Teacher.exists?(user_id: user.id, university: 'ktu')).to be true
    end
  end

  context 'when checking users data' do
    it 'full name correct' do
      user = User.create!(name: 'Tom', last_name: 'Mac', age: 1)
      teacher = Teacher.create(university: 'ktu')
      teacher.user = user
      expect(teacher.full_name).to eq('Tom Mac')
    end
    it 'email correct' do
      teacher = teachers(:Bronius)
      expect(teacher.email).to eq('bronius.rope@gmail.com')
    end
  end

  context 'when deleted' do
    it 'same before delete' do
      expect(Teacher.count).to eq teachers.size
    end
    it 'count decreases' do
      teacher = teachers(:Tomas)
      teacher.destroy
      expect(Teacher.count).to eq teachers.size - 1
    end
    it 'deleted item does not exist' do
      teacher = teachers(:Tomas)
      Teacher.del(teacher.id)
      expect(Teacher.exists?(teacher.id)).to be false
    end
    it 'before delete exists' do
      teacher = teachers(:Tomas)
      expect(Teacher.exists?(teacher.id)).to be true
    end
  end

  context 'when entering a grade for a student' do
    let(:student_mock) do
      instance_double('Student', id: 111) # mock
    end

    let(:subject_mock) do
      instance_double('Subject', id: 222, name: 'Information Theory',
                                 teacher_id: teacher.id) # mock
    end

    let(:student) do
      Student.create!(group: 1)
    end

    let(:teacher) do
      Teacher.create!(university: 'VU')
      # instance_double('Teacher', id: 333) # mock
    end

    let(:subject) do
      Subject.create!(name: 'Information Theory', time: '8',
                      teacher_id: teacher.id)
    end

    let(:grade_mock) do
      instance_double('Grade', id: 444, grade: 5) # mock
    end

    let(:add_associations) do
      # student_object.subjects << subject_object
      # student = Student.create
      # subject = Subject.create(name: 'Information Theory', teacher_id: teacher.id)
      student.subjects << subject
    end

    it 'student does not have a specified subject' do
      # allow(student_mock).to receive(:subjects).and_return(subject_mock) # stub method
      # allow(subject_mock).to receive(:find).and_return() # stub method
      expect do
        teacher.enter_grade(student, subject,
                            grade_mock)
      end
        .to raise_error('Student does not have the subject')
    end

    # it 'student has a specified subject' do
    #   add_associations
    #   expect { teacher.enter_grade(student, subject, grade_mock) }
    #     .not_to raise_error('Student does not have the subject')
    # end

    it 'grade object is created in database after successful operation' do
      student.subjects << subject

      teacher.enter_grade(student, subject, grade_mock)
      expect(Grade.where(subject_id: subject.id,
                         student_id: student.id,
                         grade: grade_mock.grade).exists?).to be true
    end
  end

  # context 'when printed' do
  #   let(:make_all_teacher_str) do
  #     str = ''
  #     teachers.each do |teach|
  #       str += teach.name + "\n" + teach.last_name + "\n"
  #       str += '_________________________' + "\n"
  #     end
  #     str
  #   end
  #
  #   it 'test teachers printed' do
  #     teacher = teachers(:Tomas)
  #     # teacher_str = make_all_teacher_str
  #     str = teacher.name + "\n" + teacher.last_name + "\n"
  #     str += '_________________________' + "\n"
  #     expect { teacher.print_teacher }.to output(str).to_stdout
  #   end
  # end
end
