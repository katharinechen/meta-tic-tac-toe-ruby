class Game

  attr_reader :players, :board, :turn, :current_player

  def initialize
    @playerX = Player.new("X")
    @playerO = Player.new("O")
    @players = [@playerX, @playerO]
    @board = [Board.new(1)]
    @turn = 0
    @current_player = @players[0]
  end

  def take_turn
    @players.reverse!
    @current_player = @players[0]
    @turn += 1
  end

end


