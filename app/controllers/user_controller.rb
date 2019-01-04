# frozen_string_literal: true

# user controller class
# :reek:InstanceVariableAssumption
class UserController < ApplicationController
  protect_from_forgery

  def register
    @user = User.new
    set_basic
    set_advanced
    rendering
  end

  def set_basic
    user = params.fetch(:user)
    @user.name = user.fetch('name')
    @user.last_name = user['last_name']
    @user.email = user.fetch('email')
  end

  def set_advanced
    user = params.fetch(:user)
    @user.password = user.fetch('password')
    @user.age = user.fetch('age')
    @user.role = user.fetch('role')
  end

  def login
    user = params.fetch(:user)
    usermail = user['email']
    userpass = user['password']
    @user = User.find_by(email: usermail,
                         password: userpass)

    loginrender
  end

  def loginrender
    if @user.class.equal?(User)
      @user.password = ''
      @user.save
      render json: @user
    else
      render json: 'Failed!', status: 404
    end
  end

  def delete
    User.destroy(@user.id)
  end

  def rendering
    if @user.save
      render json: @user
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
