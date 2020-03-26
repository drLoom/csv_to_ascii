require "minitest/autorun"
require 'lib/parser'

class TestParser < Minitest::Test
  def test_it_should_leave_value_same
    text = <<~TEXT
      int;string;money;
      1;aaa bbb ccc;1000.33
    TEXT

    assert_equal [[ { type: "int", value: "1" }, { type: "string", value: "aaa bbb ccc" }, { type: "money", value: "1000.33" }]],
                 Parser.new.parse(text)
  end
end
