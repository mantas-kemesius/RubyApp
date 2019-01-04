# frozen_string_literal: true

# subjects controller
# :reek:InstanceVariableAssumption
class SsubjectsController < ApplicationController
  protect_from_forgery
  def create
    @ss = Ssubjects.new
    ssubject = params.fetch(:ssubject)
    setvalues(ssubject)
    # abort @subject.inspect
    if @ss.save
      render json: 'Success!', status: 200
    else
      render json: 'Failed!', status: 404
    end
  end

  def setvalues(ssubject)
    @ss.student_id = ssubject.fetch('student_id')
    @ss.subject_id = ssubject.fetch('subject_id')
  end

  def delete
    @ss = Ssubjects.destroy(params[:student_subjects]['id'])
  end

  def fetch_all
    render json: Ssubjects.find_each
  end
end
