class Player

  attr_reader :symbol, :win_count

  def initialize(symbol)
    @symbol = symbol
    @win_count = 0
  end

  def win
    @win_count += 1
  end

end
