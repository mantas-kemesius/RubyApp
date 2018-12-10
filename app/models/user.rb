# frozen_string_literal: true

require_relative 'application_record'
# Class For user
class User < ApplicationRecord
  Error = Class.new(StandardError)
  validates_uniqueness_of :email,
                          message: 'your email should be unique'
  validates_length_of :name, maximum: 40,
                             message: 'name maximum length 40 chars'
  validates_length_of :last_name,
                      maximum: 40,
                      message: 'last name maximum length 40 chars'
  validates_length_of :email,
                      maximum: 60, message: 'email maximum length 40 chars'
  validates_length_of :password,
                      maximum: 30, message: 'password max length 40 chars'
  validates :age, inclusion: 1...100, length: { minimum: 1, maximum: 3 }
  has_one :teacher
  has_one :student
  has_many :to_emails, foreign_key: 'to_id', class_name: 'Email'
  has_many :from_emails, foreign_key: 'receiver_id', class_name: 'Email'

  def self.add(name, last_name, email, password, age)
    create(name: name, last_name: last_name, email: email,
           password: password, age: age)
  end

  def self.del(user_id)
    destroy(user_id)
  end

  def update_name(name)
    raise Error unless is_name_long_enough(name)
    update(name: name)
  end

  def self.update_last_name(last_name)
    update(last_name: last_name)
  end

  def self.update_password(password)
    update(password: password)
  end

  def self.update_age(age)
    update(age: age)
  end

  def check_password(password, validator)
      raise Error unless validator.valid?(password)

      'password valid'
  end

  def valid?(data)
    true #check or not empty
  end

  def send_email(to_id, title, text)
    return unless User.exists?(to_id)

    Mail.create(from_id: id, to_id: to_id, title: title, message: text)
  end

  def is_name_long_enough(name)
    name.length > 100
  end
end
