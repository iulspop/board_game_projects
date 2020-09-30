require 'io/console'
load 'ascii_art.rb'

VALID_MOVES = {
  'q' => [0, 0],
  'w' => [0, 1],
  'e' => [0, 2],
  'a' => [1, 0],
  's' => [1, 1],
  'd' => [1, 2],
  'z' => [2, 0],
  'x' => [2, 1],
  'c' => [2, 2]
}

RULES_MESSAGE = <<-MSG
The rules are: 
    Two players, X and O, take turns marking the spaces in a 3×3 grid. 

    The player who succeeds in placing three of their marks
    in a horizontal, vertical, or diagonal row wins the round.

    The first to win three rounds wins the game!
MSG

MOVES_MESSAGE = <<-MSG
To mark a square, select one of the following:
    q w e
    a s d
    z x c
MSG

def prompt(message, *extra)
  puts "==> #{message}", *extra
end

def clear_screen
  system('clear') || system('clr')
end

def any_key_to_continue(message)
  prompt message
  STDIN.getch
end

def welcome
  clear_screen()
  sleep 0.4
  puts TICTACTOE, ''

  sleep 0.4
  prompt RULES_MESSAGE, ''

  any_key_to_continue('Press any key to start playing...')
end

def assign_signs
  human_sign = ['X', 'O'].sample
  computer_sign = human_sign == 'X' ? 'O' : 'X'
  [human_sign, computer_sign]
end

def display_board(board)
  clear_screen()
  p board
end

def get_human_move(moves)
  prompt 'It your turn to mark a space.', ''
  player_move = ''
  loop do
    prompt MOVES_MESSAGE
    player_move = gets.chomp
    break if moves.include?(player_move)
    clear_screen()
    puts 'Oops, invalid move.'
  end
  player_move
end

def get_computer_move(moves)
  prompt 'It\'s the computers turn.', ''
  any_key_to_continue 'Press any key for computer mark square...'
  moves.keys.sample
end

def update_available_moves!(move, moves)
  moves.delete(move)
end

def update_board!(move, sign, board)
  move = VALID_MOVES[move]
  board[move[0]][move[1]] = sign
end

def make_a_move(player, sign, moves, board)
  move = player == "human" ? get_human_move(moves): get_computer_move(moves)
  update_available_moves!(move, moves)
  update_board!(move, sign, board)
end

def get_board_slices(board)
  diagonal_0 = board[0][0] + board[1][1] + board[2][2]
  diagonal_1 = board[0][2] + board[1][1] + board[2][0]

  vertical_0 = board[0][0] + board[1][0] + board[2][0]
  vertical_1 = board[0][1] + board[1][1] + board[2][1]
  vertical_2 = board[0][2] + board[1][2] + board[2][2]

  horizontal_0 = board[0].join
  horizontal_1 = board[1].join
  horizontal_2 = board[2].join

  [diagonal_0, diagonal_1,
   vertical_0, vertical_1, vertical_2,
   horizontal_0, horizontal_1, horizontal_2]
end

def win?(board)
  get_board_slices(board).any? { |slice| slice.match? /(XXX)|(OOO)/ }
end

def tie?(board)
  board.all? { |row| row.all? { |square| square.match? /X|O/ } }
end

def pass_initiative(initiative)
  initiative == 'X' ? 'O' : 'X'
end

# welcome()
loop do
  scores = {
    human_score: 0,
    computer_score: 0
  }

  loop do
    board = [
      ['','',''],
      ['','',''],
      ['','','']
    ]
    moves = VALID_MOVES.dup
    human_sign, computer_sign = assign_signs
    initiative = 'X'

    loop do
      display_board(board)

      if initiative == human_sign
        make_a_move("human", human_sign, moves, board)

      elsif initiative == computer_sign
        make_a_move("computer", computer_sign, moves, board)
      end

      break if win?(board) || tie?(board)
      initiative = pass_initiative(initiative)
    end

    display_board(board)
    break
  end

  break
end

=begin
begin loop
  Set Score

  begin loop
    Assign randomly X or O for player

    begin loop
      Display board
      Display what players signs
      Ask for player to mark a square or any key for computer to mark square
      Check win or fill
      update initiative
    end

    Display round winner
    Update score
    Win Game?
  end

  Play again?
  Goobye
end
=end
