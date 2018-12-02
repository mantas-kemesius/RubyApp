# frozen_string_literal: true

class SubjectController < ApplicationController
  protect_from_forgery

  def create
    @subject = Subject.new
    @subject.name = params[:subject]['name']
    @subject.time = params[:subject]['time']
    @subject.teacher_id = params[:subject]['id']
    if @subject.save
      render json: Subject.find_by(
        teacher_id: params[:subject]['id']
      ), status: 200
    else
      render json: 'Failed!', status: 404
    end
  end

  def delete
    @subject = Subject.destroy(params[:subject]['id'])
  end

  def fetchAll
    render json: Subject.find_each
  end

end
