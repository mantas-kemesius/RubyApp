# frozen_string_literal: true

require_relative '../test_helper'
class TeacherTest < ActiveSupport::TestCase
  test 'find element in database' do
    #teacher = Teacher.new('name', 'surname')
    assert_equal 'Tadas', teachers(:Tadas).name
  end
end
