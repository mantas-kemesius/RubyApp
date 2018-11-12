# User model
class User < ActiveRecord::Base
  validates_uniqueness_of :email, message: "your email should be unique"
  validates_length_of :name, maximum: 40, message: "name maximum length 40 characters"
  validates_length_of :lastname, maximum: 40, message: "lastname maximum length 40 characters"
  validates_length_of :email, maximum: 60, message: "email maximum length 40 characters"
  validates_length_of :university, maximum: 60, message: "university maximum length 40 characters"
  validates :age, inclusion: 1...100
end
