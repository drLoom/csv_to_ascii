require "minitest/autorun"
require 'lib/formats/default_format'
require 'lib/formats/string_format'

class TestStringFormat < Minitest::Test
  def test_it_should_split_value_into_array
    assert_equal ["abc", "bca"], Formats::StringFormat.format("abc bca")
  end
end
