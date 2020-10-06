load 'ascii_art.rb'

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

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

  puts 'Welcome to Tic Tac Toe game!', ''
  prompt RULES_MESSAGE, ''

  any_key_to_continue('Press any key to start playing...')
end

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

def calc_aces_value(total, hand)
  value = 0
  aces_count = hand.count { |(value, _)| value == 'Ace' }

  value += aces_count * 11
  aces_count.times { value -= 10 if total + value > 21 }

  value
end

def calc_hand_total(hand)
  total = 0

  hand.each do |(value, _)|
    if %w[King Queen Jack].include? value
      total += 10
    elsif value.is_a? Integer
      total += value
    end
  end

  total += calc_aces_value(total, hand)
end

def calc_totals(hands)
  totals = { player: 0, dealer: 0 }

  hands.each do |participant, hand|
    totals[participant] = calc_hand_total(hand)
  end

  totals
end

def concat_card(card1, card2)
  lines1 = card1.split("\n")
  lines2 = card2.split("\n")
  lines3 = EMPTY_SPACE.split("\n")
  concat_lines = []

  lines1.each_with_index do |line, index|
    concat_lines << line + lines3[index] + lines2[index]
  end

  concat_lines.join("\n")
end

def concat_hand(hand)
  hand.reduce { |concat, card| concat_card(concat, card) }
end

def get_card_index(value)
  case value
  when "Ace"   then 12
  when "King"  then 11
  when "Queen" then 10
  when "Jack"  then 9
  else
    if value.is_a? Integer then value - 2 end
  end
end

def to_ascii_card((value, suit))
  DECK[suit][get_card_index(value)]
end

def to_ascii_hand(hand)
  ascii_hand = hand.map { |card| to_ascii_card(card) }
  concat_hand(ascii_hand)
end

def values_and_total(hand, total)
  values = ''
  hand.each_with_index do |card, index|
    values << card[0].to_s.center(11)
    values << '  +  ' if index != hand.length - 1
  end
  values + ' =   ' + total.to_s
end

def display_hands(hands, totals)
  clear_screen
  hands.each do |participant, hand|
    puts "====== #{participant.upcase}'S HAND ======"
    puts to_ascii_hand(hand), ''
    puts values_and_total(hand, totals[participant]), '', ''
  end
end

loop do
  deck = create_deck
  hands = get_hands(deck)
  totals = calc_totals(hands)
  round_winner = nil

  display_hands(hands, totals)
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
