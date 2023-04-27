require_relative 'board.rb'

class Game
  def initialize(board = Board.new)
    @board = board
  end

  def play
    introduction
    game_play
  end

  def game_play
    i = 1
    loop do
      player = check_player(i)
      puts "Player #{player} turn"
      sigil = check_sigil(player)
      @board.player_input(input, sigil)
      @board.display
      break if @board.game_over?

      i += 1
    end
  end

  def check_player(num)
    num.odd? ? 1 : 2
  end

  def check_sigil(player)
    player == 1 ? 'X' : 'O'
  end

  def input
    gets.chomp
  end

  def introduction
    puts 'Welcome to tic-tac-toe'
    puts 'Player 1 is X and player 2 is O'
    puts "#{@board.display_board} \n Is the board"
  end
end

