# frozen_string_literal: true

require_relative '../test_helper'
# Subject tests
class SubjectTest < ActiveSupport::TestCase
  test 'find one' do
    assert_equal 'Algebra', subjects(:Algebra).name
  end
end
