# frozen_string_literal: true

# subject controller class
# :reek:InstanceVariableAssumption
class SubjectController < ApplicationController
  protect_from_forgery
  def create
    parameters = params.fetch(:subject)
    @subject = Subject.new
    assign(parameters)
    if @subject.save
      render json: @subject
    else
      render json: 'Failed!', status: 404
    end
  end

  def assign(parameters)
    @subject.name = parameters.fetch('name')
    @subject.time = parameters.fetch('time')
    @subject.teacher_id = parameters.fetch('id')
  end

  def delete
    Subject.destroy(params.fetch(:subject).fetch('id'))
  end

  def fetch_all
    render json: Subject.find_each
  end
end
