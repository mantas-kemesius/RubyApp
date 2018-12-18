
class LecturesController < ApplicationController
  def index
    @lectures = Lecture.where(teacher: current_user['email'])
  end

  def addstudent
    otherparams = params
    return unless otherparams.key?(:lecture)

    Lecture.find_by(id: params.fetch(:id))
           .add_student(params.fetch(:lecture).fetch(:student))
  end

  def create
    return unless params.key?(:lecture)

    @hash = params.fetch(:lecture)
    Lecture.create(name: @hash.fetch(:name),
                   teacher: @hash.fetch(:teacher),
                   status: @hash.fetch(:status),
                   credits: @hash.fetch(:credits))
  end

  def credsmanag
    @lect = params.fetch(:lecture)
    StudyManagement.new.credits_setter(@lect.fetch(:id), @lect.fetch(:credits))
  end

  def allseters(lecture)
    @lect = params.fetch(:lecture)
    credsmanag
    lecture.status_set(@lect.fetch(:status))
    lecture.name = @lect.fetch(:name)
    lecture.teacher = @lect.fetch(:teacher)
  end

  def update
    return unless params.key?(:lecture)

    lect = Lecture.find_by(id: params.fetch(:lecture).fetch(:id))
    allseters(lect)
    lect.save
  end

  def destroy
    Lecture.find_by(id: params.fetch(:id)).destroy
  end
end
