require 'console_in_out'

describe Console_in_out do
  let(:input) { StringIO.new }
  let(:output) { StringIO.new }
  let(:console_in_out) { Console_in_out.new(input, output) }

  it 'Writes to output' do
    input = "It's a string!"
    console_in_out.print(input)
    expect(console_in_out.output.string).to eq("It's a string!\n")
  end

  it 'Gets player name' do
    allow(input).to receive(:gets).and_return('A name')
    expect(console_in_out.get_input).to eq('A name')
  end

  it 'Sets board size' do
    allow(input).to receive(:gets).and_return('6')
    expect(console_in_out.set_board_size).to eq(6)
  end

  it 'Gets a move' do
    allow(input).to receive(:gets).and_return('8')
    expect(console_in_out.select_move).to eq 8
  end
end
