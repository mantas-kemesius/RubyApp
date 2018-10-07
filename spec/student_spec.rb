require 'spec_helper.rb'
RSpec.describe Student do
  student = Student.new('s1611123', 'MIF', 2)

  it 'initial student data was set successful' do
    expect(student.s_id).to eq 's1611123'
    expect(student.faculty).to eq 'MIF'
    expect(student.group).to eq 2
    expect(student.subjects).to eq [[]]
    expect(student.timetable).to eq [[]]
    expect(student.marks).to eq [[]]
    expect(student.active).to eq 0
  end

  it 'initial student data was set unsuccessful' do
    expect(student.s_id).not_to eq 'S1112531'
    expect(student.faculty).not_to eq 'MIT'
    expect(student.group).not_to eq '3'
    expect(student.subjects).not_to eq [['Matematika']]
    expect(student.timetable).not_to eq ['Pirmadienis 8-10 Matematika']
    expect(student.marks).not_to eq [4, 5, 3, 2, 8, 9, 8]
    expect(student.active).not_to eq 1
  end
end

RSpec.describe Student do
  student = Student.new('s1611123', 'MIF', 2)
  it 'adding mark was successful' do
    student.add_mark(5)
    expect(student.marks.last).to eq 5
  end

  it 'adding mark was unsuccessful' do
    student.add_mark(5)
    expect(student.marks.last).not_to eq 9
  end

  it 'adding subject was successful' do
    student.add_subject('Anglu')
    expect(student.subjects.last).to eq 'Anglu'
  end

  it 'adding subject was unsuccessful' do
    student.add_subject('Anglu')
    expect(student.subjects.last).not_to eq 'Matematika'
  end

  it 'changing group was successful' do
    student.change_group(3)
    expect(student.group).to eq 3
  end
end
RSpec.describe Student do
  student = Student.new('s1611123', 'MIF', 2)
  it 'changing group was unsuccessful' do
    student.change_group(3)
    expect(student.group).not_to eq 4
  end

  it 'changing student state to active was successful' do
    student.make_student_activity(1)
    expect(student.active).to eq 1
  end

  it 'changing student state to active was unsuccessful' do
    student.make_student_activity(1)
    expect(student.active).not_to eq 0
  end

  it 'changing student state to unactive was successful' do
    student.make_student_activity(0)
    expect(student.active).to eq 0
  end

  it 'changing student state to unactive was unsuccessful' do
    student.make_student_activity(0)
    expect(student.active).not_to eq 1
  end
end
