require_relative 'board.rb'

class Game
  def initialize
    @board = Board.new
  end

  def play
    puts 'Welcome to tic-tac-toe'
    puts 'Player 1 is X and player 2 is O'
    puts "#{@board.display_board} \n Is the board"
    loop do
      puts 'Player 1 turn'
      @board.player(gets.chomp , 'X')
      @board.display
      break if @board.checker
      puts 'Player 2 turn'
      @board.player(gets.chomp , 'O')
      @board.display
      break if @board.checker
    end

  end
end

game = Game.new
game.play