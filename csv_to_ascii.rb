require 'lib/all'

class CsvToAscii
  def perform(file)
    text = File.read(file)

    rows_with_types = Parser.new.parse(text)
    table           = Table::AsciiTable.new(rows_with_types)

    Printer.new.print(table)
  end
end

if __FILE__ == $PROGRAM_NAME
  CsvToAscii.new.perform(ARGV.first)
end
