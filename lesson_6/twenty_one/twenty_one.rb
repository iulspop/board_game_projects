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

def draw_card(deck, hand)
  drawn_card = deck.sample
  hand << drawn_card
  deck.delete drawn_card
end

def get_hands(deck)
  hands = { player: [], dealer: [] }
  2.times do
    draw_card(deck, hands[:player])
    draw_card(deck, hands[:dealer])
  end
  hands
end

def calc_ace(total, hand)
  if total + 11 <= 21
    11
  else
    1
  end
end

def calc_hand(hand)
  total = 0

  hand.each do |(value, _)|
    if "Ace" == value
      total += calc_ace(total, hand)
    elsif %w[King Queen Jack].include? value
      total += 10
    elsif value.is_a? Integer
      total += value
    end
  end

  total
end

def calc_totals(hands, skip_ace = false)
  totals = { player: 0, dealer: 0 }

  hands.each do |participant, hand|
    totals[participant] = calc_hand(hand)
  end

  totals
end

# def display_hands(hands)

# end

loop do
  deck = create_deck
  hands = get_hands(deck)
  p totals = calc_totals({:player=>[["Ace", "Hearts"], ["Queen", "Hearts"], ["Ace", 'por']], :dealer=>[[2, "Diamonds"], ['Ace', "Hearts"], [5, "Hearts"], ['Ace', "Hearts"]]})
  round_winner = nil

  # display_hands(hands)
  break
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
