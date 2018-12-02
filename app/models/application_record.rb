# frozen_string_literal: true

require 'active_record'
# ApplicationRecord class
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
