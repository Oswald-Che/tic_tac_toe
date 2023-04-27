# frozen_string_literal: true

require_relative '../game.rb'
# testing game class

describe Game do
  describe '#game_play' do
    subject(:game_loop) { described_class.new(board) }
    let(:board) { instance_double(Board) }
    
    
    context 'when its player 1 turn' do
      before do
        allow(game_loop).to receive(:check_player).and_return(1)
        allow(game_loop).to receive(:puts)
        allow(game_loop).to receive(:check_sigil).and_return('X')
        allow(game_loop).to receive(:input).and_return('3')
        allow(board).to receive(:player_input)
        allow(board).to receive(:display)
        allow(board).to receive(:game_over?).and_return(true)
      end

      it 'displays correct message' do
        expect(game_loop).to receive(:puts).with('Player 1 turn')
        game_loop.game_play
      end

      it 'send command to board' do
        expect(board).to receive(:player_input).with('3', 'X')
        game_loop.game_play
      end

      it 'ask to display' do
        expect(board).to receive(:display)
        game_loop.game_play
      end
    end

    context 'when it player 2 turn' do
      before do 
        allow(game_loop).to receive(:check_player).and_return(2)
        allow(game_loop).to receive(:puts)
        allow(game_loop).to receive(:check_sigil).and_return('O')
        allow(game_loop).to receive(:input).and_return('3')
        allow(board).to receive(:player_input)
        allow(board).to receive(:display)
        allow(board).to receive(:game_over?).and_return(true)
      end

      it 'displays correct message' do
        expect(game_loop).to receive(:puts).with('Player 2 turn')
        game_loop.game_play
      end

      it 'send command to board' do
        expect(board).to receive(:player_input).with('3', 'O')
        game_loop.game_play
      end
    end
  end

  describe '#check_player' do
    subject(:game_check_player) { described_class.new }
    let(:number) { double('number') }

    context 'when number is odd ' do
      before do 
        allow(number).to receive(:odd?).and_return(true)
      end

      it 'returns 1' do
        return_value = game_check_player.check_player(number)
        expect(return_value).to eq(1)
      end
    end
  end

end
