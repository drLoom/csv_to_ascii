require "minitest/autorun"
require 'lib/all'

class TestParser < Minitest::Test
  def test_it_should_proper_format_row
    types = [[ { type: 'int', value: '1' }, { type: 'string', value: 'abc bca' }, { type: 'string', value: 'abc bca' } ]]

    widths = types.map { |r| r.size }.max

    row = Table::Row.build_rows(types, widths).first
    row.apply_format!(Printer::DEFAULT_PRINT_OPTS[:cell_formats])

    printer = Printer.new
    assert '|1|abc|abc|', printer.printable_row(row, row.cols_width, 0)
  end
end
