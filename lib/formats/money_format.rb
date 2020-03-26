module Formats
  class MoneyFormat < DefaultFormat
    def self.format(value)
      return '' if value.empty?

      parts = value.split('.')

      chars    = parts.first.chars.reverse
      formated = []
      i        = 0
      while i < chars.size
        formated.unshift(chars[i])
        formated.unshift(' ') if (i + 1) % 3 == 0
        i += 1
      end
      parts[0] = formated.join
      parts[1] = format_fraction(parts[1])

      parts.join(',')
    end

    private

    def self.format_fraction(fraction)
      return fraction.ljust(2) if fraction.size <= 2

      if fraction[2] != '0'
        fraction[1] = "#{fraction[1].to_i + 1}" # :)
      end

      fraction[0..1]
    end
  end
end
