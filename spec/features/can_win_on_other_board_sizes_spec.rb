require 'tictactoe_jules'

describe Tictactoe_jules do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    @in_out = Console_in_out.new(input, output)
    @player_x = Human_player.new('Player 1', 'X')
    @player_o = Human_player.new('Player 2', 'O')
  end

  it 'Win with row 4x4' do
    board = Board.new(4)
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    console_game_controller = Console_game_controller.new(tictactoe_jules, @in_out)
    allow(console_game_controller.in_out.input).to receive(:gets).and_return('9', '2', '5', '3', '8', '4', '6', '1')
    console_game_controller.go
    expect(console_game_controller.tictactoe_jules.winner).to be true
  end

  it 'Win with column 5x5' do
    board = Board.new(5)
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    console_game_controller = Console_game_controller.new(tictactoe_jules, @in_out)
    allow(console_game_controller.in_out.input).to receive(:gets).and_return('1', '2', '6', '5', '11', '12', '21', '17', '16', '22')
    console_game_controller.go
    expect(console_game_controller.tictactoe_jules.winner).to be true
  end

  it 'Win with column 7x7' do
    board = Board.new(7)
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    console_game_controller = Console_game_controller.new(tictactoe_jules, @in_out)
    allow(console_game_controller.in_out.input).to receive(:gets).and_return('1', '2', '9', '5', '17', '12', '25', '18', '33', '22', '41', '30', '49')
    console_game_controller.go
    expect(console_game_controller.tictactoe_jules.winner).to be true
  end
end
