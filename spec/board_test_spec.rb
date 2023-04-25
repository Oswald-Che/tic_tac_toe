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
      subject(:game_win) {described_class.new([1, 2, 5], [3, 4, 6])}
      it 'is not a win do' do
        expect(game_win).not_to be_win
      end
    end
  end
end
