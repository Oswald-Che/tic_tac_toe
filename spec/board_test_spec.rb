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
end
