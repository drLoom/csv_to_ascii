class Parser

  DEFAULT_TYPE = 'default'.freeze
  DEFAULT_SEPARATOR = ';'.freeze

  def parse(text)
    lines = text.split("\n").map! { |line| line.split(DEFAULT_SEPARATOR) }
    headers = lines.shift

    rows = []
    lines.each do |line|
      row = []
      line.map.with_index do |value, idx|
        row << { type: (headers[idx] || DEFAULT_TYPE), value: value }
      end

      rows << row
    end

    rows
  end
end
