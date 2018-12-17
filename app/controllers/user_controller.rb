# frozen_string_literal: true

# user controller class
class UserController < ApplicationController
  protect_from_forgery
  def register
    @user = User.new
    @user.name = params[:user]['name']
    @user.last_name = params[:user]['last_name']
    @user.email = params[:user]['email']
    @user.password = params[:user]['password']
    @user.age = params[:user]['age']
    @user.role = params[:user]['role']
    @user.token = Digest::MD5.new.hexdigest(params[:user]['email'])
    if @user.save
      render json: User.find_by(
        email: params[:user]['email'],
        password: params[:user]['password']
      ), status: 200
    else
      render json: 'Failed!', status: 404
    end
  end

  def login
    @user = User.find_by(email: params[:user]['email'],
                         password: params[:user]['password'])
    if @user.nil?
      render json: 'Failed!', status: 404
    else
      @user.password = ''
      render json: @user, status: 200
    end
  end

  def delete
    User.destroy(@user.id)
  end

  def modify_age
    @user.age = params.fetch(:user).fetch('age')
    @user.save
  end

  def fetch_all
    render json: User.find_each
  end
end
