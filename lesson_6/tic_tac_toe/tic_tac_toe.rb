require 'io/console'
load 'ascii_art.rb'
load 'constants.rb'
load 'methods.rb'

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
    human_marker, computer_marker = assign_markers
    initiative = 'X'
    round_winner = nil

    loop do
      display_board(board)

      if initiative == human_marker
        make_a_move("human", human_marker, moves, board)

      elsif initiative == computer_marker
        make_a_move("computer", computer_marker, moves, board)
      end

      round_winner = get_round_winner(board, human_marker, computer_marker)
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
