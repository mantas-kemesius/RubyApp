# frozen_string_literal: true

# subject controller class
class SubjectController < ApplicationController
  protect_from_forgery
  def create
    @subject = Subject.new
    @subject.name = params[:subject]['name']
    @subject.time = params[:subject]['time']
    @subject.teacher_id = params[:subject]['id']
    # abort @subject.inspect
    if @subject.save
      render json: Subject.find_by(teacher_id: params[:subject]['id']),
             status: 200
    else
      render json: 'Failed!', status: 404
    end
  end

  def delete
    @subject = Subject.destroy(params[:subject]['id'])
  end

  def fetch_all
    render json: Subject.find_each
  end
end
