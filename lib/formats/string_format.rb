module Formats
  class StringFormat < DefaultFormat
    def self.format(value)
      return [''] if value == ''

      value.split("\s")
    end
  end
end
