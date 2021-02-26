require 'tictactoe_console_setup'
require 'console_in_out'

describe Tictactoe_console_setup do
  let(:in_out) { Console_in_out.new(StringIO.new, StringIO.new) }

  it 'Sets up a game' do
    allow(in_out.input).to receive(:gets).and_return('X', 'n', 'O','3')
    tictactoe_console_setup = Tictactoe_console_setup.new(in_out)
    expect(tictactoe_console_setup.console_game_controller.tictactoe_jules).to be_a_kind_of(Tictactoe_jules)
  end
end
