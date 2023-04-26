class Board
  def initialize(result_x = [], result_o = [], board = Array.new(9, ' '))
    @solution = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 6, 9], [1, 4, 7], [2, 5, 8], [3, 5, 7]]
    @board = board
    @result_o = result_o
    @result_x = result_x
    @winner = ''
  end

  def display_board
    puts "_1_|_2_|_3_\n_4_|_5_|_6_\n 7 | 8 | 9 "
  end

  def win?
    @solution.each do |item|
      if (item & @result_x) == item
        @winner = 'X'
        return true
      elsif (item & @result_o) == item
        @winner = 'O'
        return true
      end
    end
    false
  end

  def display
    @board.each_slice(3) do |a, b, c|
      puts "_#{a}_|_#{b}_|_#{c}_"
    end
  end

  def full?
    @board.none? ' '
  end

  def player_input(num, sigil)
    num = verify_number(num).to_i

    @board[num - 1] = sigil
    sigil == 'X' ? @result_x.push(num) : @result_o.push(num)
  end

  def verify_number(num)
    loop do
      result = @result_o + @result_x
      return num if result.none?(num.to_i) && num.match(/[1-9]/)

      puts "Position already occupied or indeterminate \n input position again"
      num = gets.chomp
    end
  end
 
  def game_over?
    if win?
      print "Game Over \n Congratulations to "
      @winner == 'X' ? print('Player 1 ') : print('Player 2')
      print " for winning the game\n"
      true
    elsif full?
      print "Game Over\nNo Space Left"
      true
    end
  end

end