module Table
  class Row
    attr_reader :cells

    DEFAULT_TYPE = { type: 'string', value: '' }.freeze

    def self.build_rows(rows_with_types, row_width)
      rows = []
      rows_with_types.each do |types|
        cells = []
        i = 0
        while i < row_width
          type = types[i] || DEFAULT_TYPE

          cells << Cell.new(type)

          i += 1
        end

        rows << new(cells)
      end

      rows
    end

    def initialize(cells)
      @cells = cells
    end

    def height
      @height = cells.map(&:height).max
    end

    def apply_format!(formats)
      cells.each do |cell|
        cell.apply_format!(formats)
      end
    end

    def cols_width
      width = {}

      cells.each_with_index do |cell, idx|
        width[idx] = cell.length
      end

      width
    end
  end
end
