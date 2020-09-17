require "io/console"

VALID_CHOICE = ['rock', 'paper', 'scissors', 'lizard', 'Spock']
VALID_SHORTCUT = VALID_CHOICE.map(&:chr).zip(VALID_CHOICE).to_h
VERBS = {
  "scissors" => {
    "paper" => "cuts",
    "lizard" => "decapitates"
  },
  "paper" => {
    "rock" => "covers",
    "Spock" => "disproves"
  },
  "rock" => {
    "scissors" => "crushes",
    "lizard" => "crushes"
  },
  "lizard" => {
    "paper" => "eats",
    "Spock" => "poisons"
  },
  "Spock" => {
    "rock" => "vaporizes",
    "scissors" => "crushes"
  }
}

WIN_CHOICES = VALID_CHOICE.permutation(2).to_a.select do |choice_pair|
  case choice_pair[0]
  when 'rock' then ['scissors', 'lizard'].include?(choice_pair[1])
  when 'paper' then ['rock', 'Spock'].include?(choice_pair[1])
  when 'scissors' then ['paper', 'lizard'].include?(choice_pair[1])
  when 'lizard' then ['Spock', 'paper'].include?(choice_pair[1])
  when 'Spock' then ['scissors', 'rock'].include?(choice_pair[1]) end
end

def prompt(message, *extra)
  puts "==> #{message}", *extra
end

def clear_screen
  system('clear') || system('clr')
end

def welcome
  clear_screen()
  puts 'The welcome to the "Rock Paper Scissors Spock Lizard" game!', ''
  sleep 0.15

  prompt(
    <<-MSG
The rules are: 
    - Scissors cuts Paper, decapitates Lizard.
    - Paper covers Rock, disproves Spock.
    - Rock crushes Scissors, crushes Lizard.
    - Lizard eats Paper, poisons Spock.
    - Spock vaporizes Rock, crushes Scissors.
     MSG
     )
  print "\n"
  prompt 'The first to score 5 points wins!', ''

  prompt 'Press any key to start game...'
  STDIN.getch
end

def print_shortcuts
  prompt 'Shortcuts:'
  VALID_SHORTCUT.each { |shortcut, choice| puts "    #{shortcut} for #{choice}"}
end

def get_choice
  choice = ''
  loop do
    prompt "Choose one: #{VALID_CHOICE.join(', ')}"
    print_shortcuts
    choice = gets.chomp

    break if VALID_CHOICE.include?(choice)
    break choice = VALID_SHORTCUT[choice] if VALID_SHORTCUT.include?(choice)
    clear_screen()
    puts 'Oops. That\'s not a valid choice.'
  end
  choice
end

def display_score(player_score, computer_score)
  clear_screen()
  puts '==== SCORE ===='
  puts "Player: #{player_score}  Computer: #{computer_score}", ''
end

def display_choices(choice, computer_choice)
    puts "You chose:      #{choice.capitalize}"
    puts "Computer chose: #{computer_choice.capitalize}", ''
end

def win?(first, second)
  choices = [first, second]
  WIN_CHOICES.include?(choices)
end

def compute_winner(player_choice, computer_choice)
  return 'player'   if win?(player_choice, computer_choice)
  return 'computer' if win?(computer_choice, player_choice)
  return 'tie'
end

def display_round_results(round_winner, player_choice, computer_choice)
  case round_winner
  when 'player'
    prompt "#{player_choice.capitalize} #{VERBS[player_choice][computer_choice]} #{computer_choice.capitalize}!"
    prompt 'You won this round.'
  when 'computer'
    prompt "#{player_choice.capitalize} #{VERBS[computer_choice][player_choice]} #{computer_choice.capitalize}!"
    prompt 'You lost this round.'
  when 'tie'
    prompt 'This round is a tie.'
  end
  puts ''
end

def display_game_winner(player_score, computer_score)
  if player_score == 5
    prompt "You won the game!"
  else
    prompt "You lost the game!"
  end
end

def play_again?
  loop do
    prompt 'Play again?'
    answer = gets.chomp.downcase
    return true  if ['yes', 'y'].include?(answer)
    return false if ['no', 'n'].include?(answer)
    clear_screen()
    puts 'Oops. Please enter Yes or No.'
  end
end

welcome()
loop do
  player_score = 0
  computer_score = 0

  loop do
    display_score(player_score, computer_score)

    player_choice = get_choice()
    computer_choice = VALID_CHOICE.sample

    round_winner = compute_winner(player_choice, computer_choice)
    player_score += 1 if round_winner == 'player'
    computer_score += 1 if round_winner == 'computer'

    display_score(player_score, computer_score)
    display_round_results(round_winner, player_choice, computer_choice)
    display_choices(player_choice, computer_choice)

    break if player_score == 5 || computer_score == 5

    prompt 'Press any key to start next round...'
    STDIN.getch
  end

  display_game_winner(player_score, computer_score)
  break unless play_again?
end

clear_screen()
puts 'Thank you for playing. Good bye!'
