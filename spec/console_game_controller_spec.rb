require 'tictactoe_jules'

describe Tictactoe_jules do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }

  before(:each) do
    @in_out = Console_in_out.new(input, output)
    @player_x = Human_player.new('Player 1', 'X')
    @player_o = Human_player.new('Player 2', 'O')
    board = Board.new
    tictactoe_jules = Tictactoe_jules.new(@player_x, @player_o, board)
    @console_game_controller = Console_game_controller.new(tictactoe_jules, @in_out)
  end

  it 'Has a method to control the tictactoe_jules flow' do
    expect(@console_game_controller).to respond_to(:go)
  end

  it 'Contains a tictactoe_jules instance' do
    expect(@console_game_controller.tictactoe_jules).to be_a_kind_of(Tictactoe_jules)
  end

  it 'Displays the welcome message' do
    allow(@in_out.input).to receive(:gets).and_return('X', 'n', 'O','3')
    expect(@console_game_controller.in_out.output.string).to include("Welcome to TicTacToe\n")
  end

  it 'Formats the board' do
    allow(@in_out.input).to receive(:gets).and_return('X', 'n', 'O','3')
    expect(@console_game_controller.in_out.output.string).to include("-----\n|123|\n|456|\n|789|\n-----")
  end
end
