# frozen_string_literal: true

# user controller class
# :reek:InstanceVariableAssumption
# :reek:TooManyStatements: enabled: false
class UserController < ApplicationController
  protect_from_forgery
  def register
    parameters = params.fetch(:user)
    save(parameters)
    rendering
  end

  def save(parameters)
    email = parameters['email']
    @user = User.new
    @user.name = parameters['name']
    @user.last_name = parameters['last_name']
    @user.email = email
    @user.password = parameters['password']
    @user.age = parameters['age']
    @user.role = parameters['role']
    @user.token = Digest::MD5.new.hexdigest(email)
  end

  def login
    parameters = params[:user]
    @user = User.find_by(email: parameters['email'],
                         password: parameters['password'])
    if @user.blank?
      render json: 'Failed!', status: 404
    else
      @user.password = ''
      render json: @user, status: 200
    end
  end

  def delete
    User.destroy(@user.id)
  end

  def rendering
    parameters = params[:user]
    if @user.save
      render json: User.find_by(
        email: parameters['email'],
        password: parameters['password']
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
