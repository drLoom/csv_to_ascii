module Table
  class AsciiTable
    attr_accessor :rows

    def initialize(rows_with_types)
      @total_columns = rows_with_types.map { |r| r.size }.max

      build_rows!(rows_with_types)
    end

    def apply_format!(formats)
      @rows.each do |row|
        row.apply_format!(formats)
      end
    end

    def cols_width
      @rows.map(&:cols_width).each_with_object({}) { |row_width, h| h.merge!(row_width) { |k, v1, v2| v1 < v2 ? v2 : v1 } }
    end

    private

    def build_rows!(rows_with_types)
      @rows = Row.build_rows(rows_with_types, @total_columns)
    end
  end
end