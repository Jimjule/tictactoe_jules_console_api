require 'console_game_controller'
require 'tictactoe_jules'
require 'human_player'
require 'board'

describe Tictactoe_jules do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  it 'Ends with player X' do
    in_out = Console_in_out.new(input, output)
    player_x = Human_player.new('Player 1', 'X')
    player_o = Human_player.new('Player 2', 'O')
    board = Board.new
    tictactoe_jules = Tictactoe_jules.new(player_x, player_o, board)
    console_game_controller = Console_game_controller.new(tictactoe_jules, in_out)
    allow(console_game_controller.in_out.input).to receive(:gets).and_return('1', '2', '3', '4', '6', '5', '7', '9', '8')
    console_game_controller.go
    expect(console_game_controller.tictactoe_jules.winner).to eq false
    expect(console_game_controller.tictactoe_jules.current_player.mark).to eq 'O'
  end
end
