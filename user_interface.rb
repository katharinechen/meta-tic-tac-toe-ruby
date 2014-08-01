require './lib/space'
require './lib/board'
require './lib/player'
require './lib/game'

def static_board_holder
  @static_board = "

        █     █                        █     █                        █     █
    1.1 █ 1.2 █ 1.3                2.1 █ 2.2 █ 2.3                3.1 █ 3.2 █ 3.3
  ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄
        █     █                        █     █                        █     █
    1.4 █ 1.5 █ 1.6                2.4 █ 2.5 █ 2.6                3.4 █ 3.5 █ 3.6
  ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄
        █     █                        █     █                        █     █
    1.7 █ 1.8 █ 1.9                2.7 █ 2.8 █ 2.9                3.7 █ 3.8 █ 3.9
        █     █                        █     █                        █     █


        █     █                        █     █                        █     █
    4.1 █ 4.2 █ 4.3                5.1 █ 5.2 █ 5.3                6.1 █ 6.2 █ 6.3
  ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄
        █     █                        █     █                        █     █
    4.4 █ 4.5 █ 4.6                5.4 █ 5.5 █ 5.6                6.4 █ 6.5 █ 6.6
  ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄
        █     █                        █     █                        █     █
    4.7 █ 4.8 █ 4.9                5.7 █ 5.8 █ 5.9                6.7 █ 6.8 █ 6.9
        █     █                        █     █                        █     █


        █     █                        █     █                        █     █
    7.1 █ 7.2 █ 7.3                8.1 █ 8.2 █ 8.3                9.1 █ 9.2 █ 9.3
  ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄
        █     █                        █     █                        █     █
    7.4 █ 7.5 █ 7.6                8.4 █ 8.5 █ 8.6                9.4 █ 9.5 █ 9.6
  ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄            ▄▄▄▄▄▄█▄▄▄▄▄█▄▄▄▄▄▄
        █     █                        █     █                        █     █
    7.7 █ 7.8 █ 7.9                8.7 █ 8.8 █ 8.9                9.7 █ 9.8 █ 9.9
        █     █                        █     █                        █     █

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
  main_choice = gets.chomp

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
