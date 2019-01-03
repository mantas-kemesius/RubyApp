# frozen_string_literal: true

# user controller class
# :reek:InstanceVariableAssumption
class UserController < ApplicationController
  protect_from_forgery

  # rubocop:disable Metrics/AbcSize
  def register
    user = set_user_data(params[:user])
    user.save
    rendering
  end

  def set_user_data(params)
    user = User.new
    user = set_name_last_name_email_password(
      user,
      params
    )
    user = set_age_role(
      user,
      params
    )
    user.token = Digest::MD5.new.hexdigest(user.email)
  end  

  # rubocop:enable Metrics/AbcSize
  def set_name_last_name(user, params)
    user.name = params['name']
    user.last_name = ['last_name']
    user.email = ['email']
    user
  end  

  def set_age_role(user, params)
    user.age = params['age']
    user.role = params['role']
    user.password = params['password']
    user
  end  

  def login
    temp = params[:user]
    @user = User.find_by(email: temp['email'],
                         password: temp['password'])
    @user.password = ''
    render json: @user, status: 200
  end

  def delete
    User.destroy(@user.id)
  end

  def rendering
    temp = params[:user]
    if @user.save
      render json: User.find_by(
        email: temp['email'],
        password: temp['password']
      ), status: 200
    else
      render json: 'Failed!', status: 404
    end
  end

  def modify_age
    @user.age = params.fetch(:user).fetch('age')
    @user.save
  end

  def modify_last_name
    @user.last_name = params.fetch(:user).fetch('last_name')
    @user.save
  end

  def fetch_all
    render json: User.find_each
  end
end
