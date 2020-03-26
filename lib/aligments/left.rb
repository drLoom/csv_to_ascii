module Alligments
  class Left
    def self.allign(value, width)
      value.ljust(width)
    end
  end
end
