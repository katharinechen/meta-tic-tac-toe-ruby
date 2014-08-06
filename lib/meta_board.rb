class MetaBoard

  attr_reader :win_meta, :meta_winner, :boards  

  def initialize
    @win_meta = false
    @meta_winner = nil

    @boards = []
    1.upto(9) do |number|
      @boards << Board.new(number)
    end
  end

  def mark_space(chosen_space, symbol)

    board_number = chosen_space[0].to_i
    space_number = chosen_space[-1].to_i 
    @boards[board_number-1].spaces[space_number-1].set_mark(symbol) 
  end 


  def win_meta_game?

    winning_board_sets = [[@boards[0],@boards[1],@boards[2]],
                          [@boards[3],@boards[4],@boards[5]],
                          [@boards[6],@boards[7],@boards[8]],
                          [@boards[0],@boards[3],@boards[6]],
                          [@boards[1],@boards[4],@boards[7]],
                          [@boards[2],@boards[5],@boards[8]],
                          [@boards[0],@boards[4],@boards[8]],
                          [@boards[2],@boards[4],@boards[6]]  ]

    winning_board_sets.each do |board_set|
      space_a = board_set[0].winning_symbol
      space_b = board_set[1].winning_symbol
      space_c = board_set[2].winning_symbol
      if (space_a == space_b) && (space_b == space_c) && (space_a != nil)
        @meta_winner = space_a
        @win_meta = true
      end
    end
    @win_meta
  end

end

