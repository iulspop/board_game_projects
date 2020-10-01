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

WIN_SCORE = 1

RULES_MESSAGE = <<-MSG
The rules are: 
    Two players, X and O, take turns marking the spaces in a 3×3 grid. 

    The player who succeeds in placing three of their marks
    in a horizontal, vertical, or diagonal row wins the round.

    The first to win three rounds wins the game!
MSG

MOVES_DISPLAY = <<-MSG
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
  clear_screen
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
  clear_screen
  p board
end

def get_unavailable_moves(available_moves)
  VALID_MOVES.keys.reject do |move|
    available_moves.keys.include?(move)
  end.join('|')
end

def diplay_moves(available_moves)
  unavailable_moves = get_unavailable_moves(available_moves)
  if unavailable_moves == ''
    puts MOVES_DISPLAY
  else
    puts MOVES_DISPLAY.gsub(/#{unavailable_moves}/, " ")
  end
end

def get_human_move(moves)
  prompt 'It your turn to mark a space.', ''
  player_move = ''
  loop do
    prompt 'To mark a square, select one of the following:'
    diplay_moves(moves)
    player_move = gets.chomp

    break if moves.include?(player_move)
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
  move = player == "human" ? get_human_move(moves) : get_computer_move(moves)
  update_available_moves!(move, moves)
  update_board!(move, sign, board)
end

def vertical_slice(index, array)
  array.each_with_object([]) { |horizontal, slice| slice << horizontal[index] }
end

def vertical_slices(array)
  slices = []
  array[0].size.times { |index| slices << vertical_slice(index, array) }
  slices
end

def horizontal_slices(array)
  array.each_with_object([]) { |horizontal, slices| slices << horizontal }
end

def diagonal_slice(array, reverse = false)
  diagonal = []
  array.each_with_index do |horizontal, index|
    diagonal << horizontal[reverse == true ? -index - 1 : index]
  end
  diagonal
end

def diagonal_slices(array)
  [diagonal_slice(array), diagonal_slice(array, reverse = true)]
end

def board_slices(board)
  [diagonal_slices(board),
   vertical_slices(board),
   horizontal_slices(board)].each { |slices| slices.map!(&:join) }.flatten
end

def win_sign(board)
  return 'X' if board_slices(board).any? { |slice| slice.match?(/XXX/) }
  return 'O' if board_slices(board).any? { |slice| slice.match?(/OOO/) }
end

def tie?(board)
  board.all? { |row| row.all? { |square| square.match?(/X|O/) } }
end

def get_round_winner(board, human_sign, computer_sign)
  return 'human' if win_sign(board) == human_sign
  return 'computer' if win_sign(board) == computer_sign
  return 'tie' if tie?(board)
end

def pass_initiative(initiative)
  initiative == 'X' ? 'O' : 'X'
end

def display_score(scores)
  puts '', '==== SCORE ===='
  puts "Player: #{scores[:human_score]}   " \
  "Computer: #{scores[:computer_score]}" , ''
end

def update_score(round_winner, scores)
  scores[:human_score] += 1 if round_winner == 'human'
  scores[:computer_score] += 1 if round_winner == 'computer'
end

def display_round_winner(round_winner)
  case round_winner
  when 'human'
    prompt 'You won this round!'
  when 'computer'
    prompt 'You lost this round!'
  when 'tie'
    prompt 'This round is a tie.'
  end
  puts ''
end

def win_game?(scores)
  scores.values.include?(WIN_SCORE)
end

def display_game_winner(scores)
  if scores[:human_score] == WIN_SCORE
    prompt "You won the game!"
  else
    prompt "You lost the game!"
  end
end

# welcome()
loop do
  scores = {
    human_score: 0,
    computer_score: 0
  }

  loop do
    board = [
      ['', '', ''],
      ['', '', ''],
      ['', '', '']
    ]
    moves = VALID_MOVES.dup
    human_sign, computer_sign = assign_signs
    initiative = 'X'
    round_winner = nil

    loop do
      display_board(board)

      if initiative == human_sign
        make_a_move("human", human_sign, moves, board)

      elsif initiative == computer_sign
        make_a_move("computer", computer_sign, moves, board)
      end

      break if round_winner = get_round_winner(board, human_sign, computer_sign)
      initiative = pass_initiative(initiative)
    end

    display_board(board)
    update_score(round_winner, scores)
    display_score(scores)

    break if win_game?(scores)
    display_round_winner(round_winner)
    any_key_to_continue('Press any key to start next round...')
  end

  display_game_winner(scores)
  break # unless play_again?
end

#goodbye
