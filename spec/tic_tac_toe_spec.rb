require 'game'

describe Game do
  subject(:game) { Game.new('Mohamed', 'Adel') }

  describe '#allocate_symbols' do
    it 'Set sympol x to player1 and o to player2' do
      game.allocate_symbols
      expect(game.player1.sym).to eql('x')
      expect(game.player2.sym).to eql('o')
    end
  end

  describe '#next_player' do
    it 'Switches current player' do
      game.next_player
      current_player = game.pick_first_turn
      expect(game.current_player).not_to eql(current_player)
    end
  end

  describe '#valid_input?' do
    it 'Test if input is valid' do
      expect(game.valid_input?(1)).to eql(true)
      expect(game.valid_input?(7)).to eql(true)
      expect(game.valid_input?(99)).to eql(false)
    end
  end
  describe '#play' do
    context 'Test winning positions' do
      it 'Test 123 positions' do
        game.player1.input << '123'
        expect(game.check_winner(game.player1)).to eql(true)
        expect(game.game_end?).to eql(true)
      end
      it 'Test 456 positions' do
        game.player1.input << '456'
        expect(game.check_winner(game.player1)).to eql(true)
        expect(game.game_end?).to eql(true)
      end
      it 'Test 789 positions' do
        game.player1.input << '789'
        expect(game.check_winner(game.player1)).to eql(true)
        expect(game.game_end?).to eql(true)
      end
      it 'Test 147 positions' do
        game.player1.input << '147'
        expect(game.check_winner(game.player1)).to eql(true)
        expect(game.game_end?).to eql(true)
      end
      it 'Test 258 positions' do
        game.player1.input << '258'
        expect(game.check_winner(game.player1)).to eql(true)
        expect(game.game_end?).to eql(true)
      end
      it 'Test 369 positions' do
        game.player1.input << '369'
        expect(game.check_winner(game.player1)).to eql(true)
        expect(game.game_end?).to eql(true)
      end
      it 'Test 159 positions' do
        game.player1.input << '159'
        expect(game.check_winner(game.player1)).to eql(true)
        expect(game.game_end?).to eql(true)
      end
      it 'Test 357 positions' do
        game.player1.input << '357'
        expect(game.check_winner(game.player1)).to eql(true)
        expect(game.game_end?).to eql(true)
      end
    end

  end
end
