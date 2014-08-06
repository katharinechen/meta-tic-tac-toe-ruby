class Board

  attr_reader :board_number, :win_game, :winning_symbol, :spaces 

  def initialize(board_number)
    @board_number = board_number
    @win_game = false
    @winning_symbol = nil

    @spaces = []
    1.upto(9) do |number|
      @spaces << Space.new(number.to_s)
    end
  end

  def win?
    winning_numbers = [[@spaces[0],@spaces[1],@spaces[2]],
                      [@spaces[3],@spaces[4],@spaces[5]],
                      [@spaces[6],@spaces[7],@spaces[8]],
                      [@spaces[0],@spaces[3],@spaces[6]],
                      [@spaces[1],@spaces[4],@spaces[7]],
                      [@spaces[2],@spaces[5],@spaces[8]],
                      [@spaces[0],@spaces[4],@spaces[8]],
                      [@spaces[2],@spaces[4],@spaces[6]]]

    winning_numbers.each do |number_set|
      space_a = number_set[0].marked_by
      space_b = number_set[1].marked_by
      space_c = number_set[2].marked_by
      if (space_a == space_b) && (space_b == space_c) && (space_a != nil)
        @win_game = true
        @winning_symbol = space_a
      end
    end
    @win_game
  end

  def set_winner_for_meta_board(symbol)
    @winning_symbol = symbol
  end
end
