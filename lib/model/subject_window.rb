require_relative 'subject'
require_relative '../../lib/helpers/files_handler'

# All subjects are placed here
class SubjectWindow
  attr_reader :subjects

  def initialize
    @subjects = []
  end

  def add_subject(subject)
    subjects << subject
  end

  def delete_subject(position)
    subjects.delete_at(position)
  end

  def print_subjects
    subjects.each(&:print_subject)
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
