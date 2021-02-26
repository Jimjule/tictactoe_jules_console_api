require 'tictactoe_jules'

describe Tictactoe_jules do
  it "Can call X 'Player 1'" do
    player_x = Human_player.new('Player 1', 'X')
    expect(player_x.id).to eq 'Player 1'
  end

  it "Can call O 'Player 2'" do
    player_o = Human_player.new('Player 2', 'O')
    expect(player_o.id).to eq 'Player 2'
  end
end
