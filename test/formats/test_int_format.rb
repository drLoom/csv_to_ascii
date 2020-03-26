require "minitest/autorun"
require 'lib/formats/default_format'
require 'lib/formats/int_format'

class TestIntFormat < Minitest::Test
  def test_it_should_leave_value_same
    assert_equal "55.5", Formats::IntFormat.format("55.5")
  end
end
