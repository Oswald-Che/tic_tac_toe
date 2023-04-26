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
    !@board.include? ' '
  end

  def player(num, sigil)
    if @result.include?(num) || !(1..9).include?(num)
      puts 'Position already occupied or indeterminate  '
      display
      puts 'input different a different number'
      return player(gets.chomp.to_i, sigil)
    end

    @board[num - 1] = sigil == 'X' ? 'X' : 'O'
    @result.push(num)
    sigil == 'X' ? @resultX.push(num) : @resultO.push(num)
  end
 
  def checker
    if win?
      puts 'Game Over'
      print 'Congratulations to '
      @winner == 'X' ? print('Player 1 ') : print('Player 2')
      print " for winning the game\n"
      true
    elsif full?
      puts 'No Space Left'
      puts 'Game Over'
      true
    end
  end

end