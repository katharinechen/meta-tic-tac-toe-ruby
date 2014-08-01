require 'rspec'
require 'player'
require 'space'
require 'board'
require 'meta_board'
require 'game'


describe :Space do

  describe :initialize do
    it 'initializes a space object' do
      new_space = Space.new(1)
      expect(new_space).to be_an_instance_of Space
    end
  end

  describe :set_mark do
    it 'should mark a space with a symbol' do
      new_space = Space.new(1)
      expect(new_space.marked_by).to eq(nil)
      new_space.set_mark("X")
      expect(new_space.marked_by).to eq("X")
    end
  end
end

describe :Player do

  describe :initialize do
    it 'initializes a player object' do
      new_player = Player.new("X")
      expect(new_player).to be_an_instance_of Player
      expect(new_player.symbol).to eq("X")
    end
  end

  describe :win do
    it 'return the number of times the player has won' do
      new_player = Player.new("X")
      expect(new_player.win).to eq(1)
    end
  end
end

describe :Board do

  describe :initialize do
    it 'initializes a board object' do
      new_board = Board.new(1)
      expect(new_board).to be_an_instance_of Board
      expect(new_board.spaces.length).to eq(9)
    end
  end

  describe :win? do
    it "should set win_game to true if the player has three in a row" do
      new_board = Board.new(1)
      new_board.spaces[0].set_mark("X")
      new_board.spaces[4].set_mark("X")
      new_board.spaces[8].set_mark("X")
      expect(new_board.win?).to eq true
      expect(new_board.winning_symbol).to eq("X")
    end
  end
end

describe :MetaBoard do

  describe :initialize do
    it 'initializes a board with 9 board objects' do
      new_meta = MetaBoard.new
      expect(new_meta).to be_an_instance_of MetaBoard
      expect(new_meta.boards.length).to eq(9)
    end
  end

  describe :win_meta_game? do
    it "should set win_meta_game to true" do
      new_meta = MetaBoard.new
      new_meta.boards[0].set_winner("X")
      new_meta.boards[1].set_winner("X")
      new_meta.boards[2].set_winner("X")
      expect(new_meta.win_meta_game?).to eq true
      expect(new_meta.meta_winner).to eq("X")
    end
  end
end

describe :Game do

  describe :initialize do
    it 'initializes a game object' do
      new_game = Game.new
      expect(new_game).to be_an_instance_of Game
      expect(new_game.players.length).to eq(2)
      expect(new_game.board.length).to eq (1)
    end
  end

  describe :take_turn do
    it 'should have turns' do
      new_game = Game.new
      expect(new_game.take_turn).to eq(1)
      expect(new_game.current_player.symbol).to eq("O")
    end
  end
end
