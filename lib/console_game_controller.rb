class Console_game_controller
  attr_reader :tictactoe_jules, :in_out

  def initialize(tictactoe_jules, in_out)
    @tictactoe_jules = tictactoe_jules
    @in_out = in_out
    welcome
    format_board
  end

  def go
    until @tictactoe_jules.game_is_over
      take_turn
    end
    announce_winner
  end

  def take_turn
    if @tictactoe_jules.current_player.instance_of? Human_player
      @in_out.print("#{@tictactoe_jules.current_player.id}'s move")
      move = select_move(@tictactoe_jules.board)
      @tictactoe_jules.submit_move(move)
    else 
      move = @tictactoe_jules.current_player.select_move(@tictactoe_jules.board)
      @tictactoe_jules.submit_move(move)
    end
    @in_out.clear
    format_board
  end

  def select_move(board)
    valid_move = false
    until (valid_move)
      @in_out.print("Please enter a free number from 1-#{board.max_turns}\n")
      player_input = @in_out.select_move
      valid_move = player_input <= @tictactoe_jules.board.max_turns && player_input >= -@tictactoe_jules.board.max_turns && @tictactoe_jules.board.is_square_free?(player_input)
    end
    @tictactoe_jules.current_player.select_move(board, player_input)
  end

  def welcome
    @in_out.clear
    @in_out.print('Welcome to TicTacToe')
  end

  def announce_winner
    @in_out.print("#{@tictactoe_jules.current_player.id} is the winner!") if @tictactoe_jules.winner
    @in_out.print('Draw!') unless @tictactoe_jules.winner
  end

  def format_board
    board = []
    board_middle = @tictactoe_jules.board.get_board_values
    board << board_top_and_bottom
    assemble_board_middle(board, board_middle)
    board << board[0]
    board
    @in_out.print(board)
  end

  def board_top_and_bottom
    board_top_and_bottom = []
    board_row = '-'
    beginning_and_end_length = 2
    (@tictactoe_jules.board.board_size + beginning_and_end_length).times do
      board_top_and_bottom.push(board_row)
    end
    board_top_and_bottom = [board_top_and_bottom.join]
  end

  def assemble_board_middle(board, board_middle)
    board_column = '|'
    board_middle.each do |section|
      board << board_column + section.join + board_column
    end
  end
end
