# frozen_string_literal: true

# Subject class
class Subject < ApplicationRecord
  validates_length_of :name, maximum: 40,
                             message: 'name maximum length 40 characters'
  validates :time, presence: true
  validates :teacher_id, presence: true
  belongs_to :teacher

  def self.add(name, time, teacher)
    create(name: name, time: time, teacher_id: teacher.id)
  end

  def self.del(teacher)
    subject = find_by(teacher_id: teacher)
    destroy(subject.id)
  end

  def self.update_time(time)
    update(time: time)
  end

  def self.update_name(name)
    update(name: name)
  end
end
