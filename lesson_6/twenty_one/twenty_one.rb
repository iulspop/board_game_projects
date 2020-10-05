SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

def create_deck
  SUITS.each_with_object([]) do |suit_name, deck|
    deck << 13.times.each_with_object([]) do |card_index, suit|
      case card_index
      when 12 then suit << ["Ace", suit_name]
      when 11 then suit << ["King", suit_name]
      when 10 then suit << ["Queen", suit_name]
      when 9 then suit << ["Jack", suit_name]
      else
        if card_index < 9 then suit << [card_index + 2, suit_name] end 
      end
    end
  end.flatten(1)
end

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
deck:
  array of cards, card is array [value, suit]

hand:
  array of cards, card is array [value, suit]

draw_card(deck, hand):
  drawn_card = deck.sample
  hand << drawn_card
  deck.delete drawn_card
=end
