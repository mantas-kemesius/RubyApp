# frozen_string_literal: true

require_relative 'subject_info'
# Attributes of a study subject
class Subject < SubjectInfo
  attr_reader :title, :description
  def initialize(name, description_text, number_of_credits,
                 coordinating_teacher)
    super(number_of_credits, coordinating_teacher)
    @title = name
    @description = description_text
  end

  def print_subject
    str = title + "\n" + description + "\n" + credits + "\n" + teacher + "\n"
    str += '__________________________________________________' + "\n"
    print str
  end

  def change_title(title)
    @title = title
  end

  def change_description(description)
    @description = description
  end

  def change_credits(credits)
    @credits = credits
  end

  def change_teacher(teacher)
    @teacher = teacher
  end
end
