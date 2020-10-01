require 'io/console'
load 'ascii_art.rb'
load 'methods.rb'

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

welcome
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

      round_winner = get_round_winner(board, human_sign, computer_sign)
      break if round_winner
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
  break unless play_again?
end

goodbye
