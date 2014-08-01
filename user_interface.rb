require './lib/space'
require './lib/board'
require './lib/player'
require './lib/game'

def static_board_holder
  @static_board = "
        █     █
     1  █  2  █  3
  ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄
        █     █
     4  █  5  █  6
  ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄
        █     █
     7  █  8  █  9
        █     █
      "
    @active_board = @static_board
end

def header
  system 'clear'
  puts "
  　 　 　█  █  █    ▀▀█▀▀ ▀█▀  █▀▄▀█  █▀▀█ ▀▀█▀▀  █▀▀▀
  　 　 　█  █  █      █    █   █ █ █  █▄▄█   █    █▀▀▀
  　 　 　▀▄▄▀  █▄▄█   █   ▄█▄  █   █  █  █   █    █▄▄▄

  ▀▀█▀▀ ▀█▀  █▀▀█    ▀▀█▀▀  █▀▀█  █▀▀█    ▀▀█▀▀  █▀▀▀█  █▀▀▀
    █    █   █    ▀▀   █    █▄▄█  █    ▀▀   █    █   █  █▀▀▀
    █   ▄█▄  █▄▄█      █    █  █  █▄▄█      █    █▄▄▄█  █▄▄▄
  "
end

def main_menu
  header
  puts "\n"
  puts "Type 'n' for new game of meta-tic-tic-toe or 'e' to exit"
  main_choice = gets.chomp.downcase!

  if main_choice == "n"
    @new_game = Game.new
    @active_board = @static_board
    puts "You have started a new game! You are player X!"
    static_board_holder
    game_play
  elsif main_choice == "e"
    exit
  else
    puts "Please enter a valid choice. Type 'n' for a meta-tic-tic-toe, or 'e' to exit."
    sleep 1
    main_menu
  end
end

def game_play
  if @new_game.board[0].win?
    system 'clear'
    header
    puts @active_board
    puts "You Won!"
  elsif @new_game.turn >= 9
    puts "It's a TIE! Do you even lift?"
  else
    turn
  end
end

def turn
  system 'clear'
  header
  puts @active_board
  puts "Player #{@new_game.current_player.symbol}: select a box by typing in the number"
  number = gets.chomp.to_i
  if (1..9).include?(number)
    if (@new_game.board[0].spaces[number - 1].marked_by == nil)
      @new_game.board[0].spaces[number - 1].set_mark(@new_game.current_player.symbol)
      @active_board.gsub!(number.to_s, @new_game.current_player.symbol)
      @new_game.take_turn
      game_play
    else
      puts "Invalid selection. Please try again."
      sleep 0.5
      game_play
    end
  else
    puts "Invalid selection. Please try again."
      sleep 0.5
      game_play
    end
end




  main_menu
