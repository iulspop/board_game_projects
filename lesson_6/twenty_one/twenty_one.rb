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

def concat_vertical(string1, string2)
  lines1 = string1.split("\n")
  lines2 = string2.split("\n")
  concat_lines = []

  lines1.each_with_index do |line, index|
    concat_lines << line + lines2[index]
  end

  concat_lines.join("\n")
end

def concat_many_verticals(*strings)
  strings.reduce { |concat, string| concat_vertical(concat, string) }
end

def concat_row(first, middle, last)
  concat_many_verticals(first, VERTICAL_LINE, middle, VERTICAL_LINE, last)
end

def to_ascii_sqr(square)
  case square
  when 'X' then X_MARK
  when 'O' then O_MARK
  when ''  then EMPTY_SQUARE end
end

def to_ascii_board(board)
  ascii_board = board.map { |row| row.map { |square| to_ascii_sqr(square) } }
  ascii_board.map do |row|
    concat_row(row[0], row[1], row[2]) + HORIZONTAL_LINE
  end
end

def display_hands(hands, totals)
  clear_screen
  hands.each do |participant, hand|
    puts to_ascii_hand(hand), ''
    puts totals[participant]
  end
end

loop do
  deck = create_deck
  hands = get_hands(deck)
  totals = calc_totals(hands)
  round_winner = nil

  display_hands(hands)
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
