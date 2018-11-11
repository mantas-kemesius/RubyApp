require_relative 'subject'
require_relative '../../lib/helpers/files_handler'
require 'pp'

# All subjects are placed here
class SubjectWindow
  attr_reader :subjects

  def initialize
    @subjects = []
  end

  def subject_exists?(title)
    subjects.each do |item|
      return true if item.title.eql?(title)
    end
    false
  end

  def add_subject(subject)
    subjects << subject
  end

  def delete_subject(position)
    subjects.delete_at(position)
  end

  def delete_by_title(title)
    subjects.each do |item|
      if item.title.eql?(title)
        subjects.delete(item)
        delete_by_title(title)
      end
    end
  end

  def delete_by_title_by_teacher(title, teacher)
    subjects.each do |item|
      if item.title.eql?(title) && item.teacher.eql?(teacher)
        subjects.delete(item)
        delete_by_title_by_teacher(title, teacher)
      end
    end
  end

  def print_subjects
    subjects.each(&:print_subject)
  end

  # :reek:FeatureEnvy
  def print_subjects_by_teacher(teacher)
    subjects.each do |item|
      item.print_subject if item.teacher.eql?(teacher)
    end
  end

  # :reek:FeatureEnvy
  def print_subjects_by_student(student_subjects)
    # TODO: use student object, not string of subjects names
    subjects_arr = student_subjects.split(', ')
    subjects_arr.each do |subject_title|
      subjects.each do |subject|
        subject.print_subject if subject.title.eql?(subject_title)
      end
    end
  end

  # :reek:FeatureEnvy
  def save_subjects(path)
    file = FilesHandler.new(path)
    data = []
    subjects.each do |subject|
      data[data.length] = {
        'title' => subject.title, 'description' => subject.description,
        'credits' => subject.credits, 'teacher' => subject.teacher
      }
      file.save_data('Subjects' => data)
    end
  end

  # :reek:FeatureEnvy
  def load_subjects(path)
    file = FilesHandler.new(path)
    info = file.load_data.fetch('Subjects')
    info.each do |subject|
      add_subject(Subject.new(subject.fetch('title'),
                              subject.fetch('description'),
                              subject.fetch('credits'),
                              subject.fetch('teacher')))
    end
  end
end
