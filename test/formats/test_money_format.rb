require "minitest/autorun"
require 'lib/formats/default_format'
require 'lib/formats/money_format'

class TestMoneyFormat < Minitest::Test
  DIGITS_SEP = ','

  def test_it_should_have_right_separator
    assert_equal DIGITS_SEP, Formats::MoneyFormat.format("1.03")[/,/]
  end

  def test_it_should_be_without_digit_separotor
    assert_equal "1,03", Formats::MoneyFormat.format("1.03")
  end

  def test_it_should_has_one_digit_separotor
    assert_equal 1, Formats::MoneyFormat.format("1030.25").match(/\s/).size
  end

  def test_it_should_has_two_fractional_digits_only
    assert_equal 2, Formats::MoneyFormat.format("1030.251").split(DIGITS_SEP).last.size
  end

  def test_it_should_round_up
    assert_equal "0,26", Formats::MoneyFormat.format("0.251")
  end

  def test_it_should_cut_last_zero
    assert_equal "0,25", Formats::MoneyFormat.format("0.250")
  end

  def test_it_should_proper_forma
    assert_equal "9 255 550,26", Formats::MoneyFormat.format("9255550.251")
  end

  def test_it_should_be_empty
    assert_equal "", Formats::MoneyFormat.format("")
  end
end
