require 'active_record'
# Base
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end