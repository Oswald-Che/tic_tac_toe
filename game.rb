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
    loop do
      puts 'Player 1 turn'
      @board.player(input, 'X')
      @board.display
      break if @board.checker

      puts 'Player 2 turn'
      @board.player(input, 'O')
      @board.display
      break if @board.checker
    end
  end

  def try
    i = 1
    loop do
      player = i.odd? ? 1 : 2
      puts "Player #{player} turn"
      sigil = check_sigil(player)
      @board.player(input, sigil)
      @board.display
      break if @board.checker

      i += 1
    end
  end

  def check_sigil(num)
    num == 1 ? 'X' : 'O'
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

