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
end
