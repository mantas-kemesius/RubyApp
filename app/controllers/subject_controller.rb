# frozen_string_literal: true

# subject controller class
# :reek:InstanceVariableAssumption
class SubjectController < ApplicationController
  protect_from_forgery
  def create
    parameters = params[:subject] # rubocop Assignment Branch Condition size err
    @subject = Subject.new
    @subject.name = parameters['name']
    @subject.time = parameters['time']
    @subject.teacher_id = parameters['id']
    if @subject.save
      render json: Subject.find_by(teacher_id: parameters['id']), status: 200
    else
      render json: 'Failed!', status: 404
    end
  end

  def delete
    @subject = Subject.destroy(params.fetch(:subject).fetch('id'))
  end

  def fetch_all
    render json: Subject.find_each
  end
end
