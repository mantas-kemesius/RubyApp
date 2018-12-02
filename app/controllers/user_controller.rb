# frozen_string_literal: true

class UserController < ApplicationController
  protect_from_forgery
  def create
    @user = User.new
    @user.name = params[:user]['name']
    @user.last_name = params[:user]['last_name']
    @user.email = params[:user]['email']
    @user.password = params[:user]['password']
    @user.age = params[:user]['age']
    @user.save
  end
end
