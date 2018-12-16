# frozen_string_literal: true

# subjects controller
class SsubjectsController < ApplicationController
  protect_from_forgery
  def create
    @ss = Ssubjects.new
    @ss.student_id = params[:ssubject]['student_id']
    @ss.subject_id = params[:ssubject]['subject_id']
    # abort @subject.inspect
    if @ss.save
      render json: 'Success!', status: 200
    else
      render json: 'Failed!', status: 404
    end
  end

  def delete
    @ss = Ssubjects.destroy(params[:student_subjects]['id'])
  end

  def fetch_all
    render json: Ssubjects.find_each
  end
end
