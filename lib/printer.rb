class Printer
  DEFAULT_PRINT_OPTS = {
    alligments:   {
      'string'  => Alligments::Left,
      'int'     => Alligments::Right,
      'money'   => Alligments::Right,
      'default' => Alligments::Right
    },
    cell_formats: {
      'string'  => Formats::StringFormat,
      'int'     => Formats::IntFormat,
      'money'   => Formats::MoneyFormat,
      'default' => Formats::DefaultFormat
    }
  }.freeze

  def initialize(print_opts = DEFAULT_PRINT_OPTS)
    @print_opts = print_opts
  end

  def alligments
    @print_opts[:alligments]
  end

  def cell_formats
    @print_opts[:cell_formats]
  end

  def row_separator(cols_width)
    @row_separator ||= horizontal_line(cols_width)
  end

  def print(table)
    table.apply_format!(cell_formats)

    cols_width    = table.cols_width
    row_separator = horizontal_line(cols_width)
    header_line   = horizontal_line(cols_width, '-')

    puts header_line
    table.rows.each do |row|
      print_row(row, cols_width)
      puts row_separator
    end
  end

  def print_row(row, cols_width)
    height = row.height

    level = 0
    while level < height
      puts printable_row(row, cols_width, level)

      level += 1
    end
  end

  def printable_row(row, cols_width, level)
    p_row = row.cells.map.with_index do |cell, col_idx|
      type_alligment = alligments[cell.type]
      val            = cell.formatted_value_at_level(level)

      type_alligment.allign(val, cols_width[col_idx])
    end.join('|')

    "|#{p_row}|"
  end

  def horizontal_line(cols_width, col_sep = '+')
    str  = '+'
    line = cols_width.values.map do |col_postion|
      '-' * col_postion
    end.join(col_sep)

    str << line << '+'
  end
end
