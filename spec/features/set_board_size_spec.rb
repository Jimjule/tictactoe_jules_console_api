require 'board'

describe Board do
  it 'Can make a 4x4 board' do
    board = Board.new(4)
    expect(board.get_board_values).to eq([["1", "2", "3", "4"], ["5", "6", "7", "8"], ["9", "10", "11", "12"], ["13", "14", "15", "16"]])
  end

  it 'A 9x9 board has 81 turns' do
    board = Board.new(9)
    expect(board.max_turns).to eq 81
  end
end
