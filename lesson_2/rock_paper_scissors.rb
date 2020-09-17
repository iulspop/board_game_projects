require "io/console"

VALID_CHOICE = ['rock', 'paper', 'scissors', 'lizard', 'Spock']
VALID_SHORTCUT = VALID_CHOICE.map(&:chr).zip(VALID_CHOICE).to_h

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
     Scissors cuts Paper, decapitates Lizard.
     Paper covers Rock, disproves Spock.
     Rock crushes Scissors, crushes Lizard.
     Lizard eat Papers, poisons Spock.
     Spock vaporizes Rock, crushes Scissors.
  MSG
  )

  print "\n"
  prompt 'Press any key to continue...'
  STDIN.getch
end

def print_shortcuts
  prompt 'Shortcuts:'
  VALID_SHORTCUT.each { |shortcut, choice| puts "#{shortcut} for #{choice}"}
end

def get_choice
  clear_screen()
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

def display_choices(choice, computer_choice)
  clear_screen()
  prompt(<<-MSG
You chose:      #{choice.capitalize}
    Computer chose: #{computer_choice.capitalize}
  MSG
        )
end

def win?(first, second)
  choices = [first, second]
  WIN_CHOICES.include?(choices)
end

def display_results(player, computer)
  if win?(player, computer) then prompt 'You won!'
  elsif win?(computer, player) then prompt 'You lost!'
  else prompt "It's a tie!" end
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

# player_score = 0
# computer_score = 0

welcome()
loop do
  # while player_score < 5 || computer_score < 5
    choice = get_choice()
    computer_choice = VALID_CHOICE.sample

    display_choices(choice, computer_choice)
    display_results(choice, computer_choice)
  # end

  break unless play_again?
end

prompt('Thank you for playing. Good bye!')
