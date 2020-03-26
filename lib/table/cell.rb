module Table
  class Cell
    attr_reader :type, :value

    def initialize(type:, value:)
      @type  = type
      @value = value
    end

    def apply_format!(formats)
      @formatted_value = formats[type].format(value)
    end

    def height
      if formatted_value.is_a?(Array)
        formatted_value.size
      else
        1
      end
    end

    def length
      if formatted_value.is_a?(Array)
        formatted_value.map(&:size).max
      else
        formatted_value.size
      end
    end

    def formatted_value
      @formatted_value || @value
    end

    def formatted_value_at_level(level)
      if formatted_value.is_a?(Array)
        formatted_value[level] || ''
      elsif level == 0
        formatted_value
      else
        ''
      end
    end
  end
end
