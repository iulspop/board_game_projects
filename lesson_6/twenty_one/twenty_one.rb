=begin
welcome

game start
  scores = { ... }

  round start
    create deck
    give hand to player and dealer
    hand_total = calculate_hand_total
    round_winner = nil

    player start
      display hands_with_total
      offer player choice, "hit" or 'stay'
      if "hit"
        add card to hand
        if hand is bust break
        next
      if 'stay' break
    player end

    if bust break
    dealer_plays
      if bust break
    end

    calculate_hands
    determine_winner

    display_hand(hands, reveal = true)
    update_score!(winner)
    display_score(scores)
    break if win_game?
    display_round_winner(round_winner)
  round end

  display_game_winner(scores)
game end

goodbye
=end

=begin
DATA STRUCTURES

=end