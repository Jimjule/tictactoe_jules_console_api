class Console_in_out
  attr_reader :input, :output

  def initialize(input, output)
    @input = input
    @output = output
  end

  def get_input
    @input.gets.chomp
  end

  def print(to_print)
    if @output.kind_of?(Array)
      @output.push(to_print)
    elsif @output.kind_of?(String)
      @output = to_print
    else
      @output.puts(to_print)
    end
  end

  def get_play_against_computer
    print("Would you like to play against the computer? (y/N)\n")
    get_input == 'y'
  end

  def set_board_size
    print('Please enter the length of a board side')
    board_size = get_input.to_i
  end

  def get_player_name(which_player)
    print("Please enter a name for #{which_player}\n")
    player_name = get_input
  end

  def select_move
    get_input.to_i
  end

  def clear
    system('clear')
  end
end
