module Alligments
  class Right
    def self.allign(value, width)
      value.rjust(width)
    end
  end
end
