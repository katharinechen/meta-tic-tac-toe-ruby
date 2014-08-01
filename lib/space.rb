class Space
  attr_reader :marked_by

  def initialize(number)
    @name = number
    @marked_by = nil
  end

  def set_mark(symbol)
    @marked_by = symbol
  end
end
