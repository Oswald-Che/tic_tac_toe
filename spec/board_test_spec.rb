# frozen_string_literal: true

require_relative '../board.rb'
# test for board.rb

describe Board do
  describe '#win?' do
    context 'when board is empty' do
      subject(:game_win) { described_class.new }
      it 'is not a win' do
        expect(game_win).not_to be_win
      end
    end

    context 'when board is full but no win' do
      subject(:game_win) { described_class.new([1, 2, 5], [3, 4, 6]) }
      it 'is not a win ' do
        expect(game_win).not_to be_win
      end
    end

    context 'when board is full and X wins' do
      subject(:game_win) { described_class.new([1, 2, 3]) }
      it 'is a win' do
        expect(game_win).to be_win
      end

      it 'updates winner to X' do
        game_win.win?
        winner = game_win.instance_variable_get(:@winner)
        expect(winner).to eq('X')
      end
    end

    context 'when board is full and O wins' do
      subject(:game_win) { described_class.new([1, 2, 4], [3, 6, 9]) }
      it 'is a win' do
        expect(game_win).to be_win
      end

      it 'updates winner to O' do
        game_win.win?
        winner = game_win.instance_variable_get(:@winner)
        expect(winner).to eq('O')
      end
    end

  end

  describe '#display' do
    subject(:game_display) { described_class.new}
    it 'calls puts 3 times' do
      expect(game_display).to receive(:puts).exactly(3).times
      game_display.display
    end
  end

  describe '#full?' do
    context 'when board is empty' do
      subject(:game_full) { described_class.new }
      it 'is not full' do
        expect(game_full).not_to be_full
      end
    end

    context 'when board is not full' do
      board = ['X', 'O', 'X', ' ', ' ', ' ', ' ', ' ', ' ']
      subject(:game_full) { described_class.new([], [], board) }
      it 'is not full' do
        expect(game_full).not_to be_full
      end
    end

    context 'when board if full' do
      board = ['X','O', 'X', 'X' ,'O', 'X', 'X', 'O', 'X']
      subject(:game_full) { described_class.new([], [], board) }
      it 'is full' do
        expect(game_full).to be_full
      end
    end
  end

  describe '#verify_number' do
    subject(:game_loop) { described_class.new([1, 3, 4], [2, 6]) }
    context 'when number is invalid and user inputs valid number' do
      before do
        valid_number = '7'
        allow(game_loop).to receive(:puts)
        allow(game_loop).to receive(:gets).and_return(valid_number)
      end

      it 'completes loop and display error message' do
        invalid_number = '6'
        expect(game_loop).to receive(:puts).once
        game_loop.verify_number(invalid_number)
      end

      it 'returns the valid number' do
        invalid_number = '1'
        return_value = game_loop.verify_number(invalid_number)
        expect(return_value).to eq('7')
      end
    end

    context 'when user inputs invalid number twice and valid number' do
      before do
        invalid_number = '4'
        valid_number = '7'
        allow(game_loop).to receive(:puts)
        allow(game_loop).to receive(:gets).and_return(invalid_number, valid_number)
      end

      it 'completes loop twice and display error message' do
        invalid_number = '6'
        expect(game_loop).to receive(:puts).twice
        game_loop.verify_number(invalid_number)
      end

      it 'returns the valid number' do
        invalid_number = '1'
        return_value = game_loop.verify_number(invalid_number)
        expect(return_value).to eq('7')
      end
    end
  end

  describe '#player_input' do
    context 'when X plays' do
      subject(:game_playerX) { described_class.new }
      before do
        allow(game_playerX).to receive(:verify_number) { '5' }
      end

      it 'updates result_x' do
        input = '5'
        sigil = 'X'
        game_playerX.player_input(input, sigil)
        result_x = game_playerX.instance_variable_get(:@result_x)
        expect(result_x).to include(input.to_i)
      end
    end

    context 'when O plays' do
      subject(:game_playerO) { described_class.new }
      before do
        allow(game_playerO).to receive(:verify_number) { '5' }
      end

      it 'updates result_o' do
        input = '5'
        sigil = 'O'
        game_playerO.player_input(input, sigil)
        result_o = game_playerO.instance_variable_get(:@result_o)
        expect(result_o).to include(input.to_i)
      end
    end
  end

  describe '#game_over?' do
    subject(:game_end) { described_class.new }
    context 'when a player wins' do
      before do
        allow(game_end).to receive(:win?).and_return(true)
        allow(game_end).to receive(:full?).and_return(false)
        allow(game_end).to receive(:print)
      end

      it 'is game over' do
        expect(game_end).to be_game_over
      end

      it 'recieve print 3 times' do
        expect(game_end).to receive(:print).exactly(3).times
        game_end.game_over?
      end
    end

    context 'when board is full' do
      before do
        allow(game_end).to receive(:win?).and_return(false)
        allow(game_end).to receive(:full?).and_return(true)
        allow(game_end).to receive(:print)
      end

      it 'is game over' do
        expect(game_end).to be_game_over
      end

      it 'recieve print once' do
        expect(game_end).to receive(:print).once
        game_end.game_over?
      end
    end
  end
end
