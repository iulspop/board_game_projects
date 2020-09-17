VALID_CHOICE = ['rock', 'paper', 'scissors', 'lizard', 'spock']

WIN_CHOICES = VALID_CHOICE.permutation(2).to_a.select do |choice_pair|
  case choice_pair[0]
  when 'rock' then ['scissors', 'lizard'].include?(choice_pair[1])
  when 'paper' then ['rock', 'spock'].include?(choice_pair[1])
  when 'scissors' then ['paper', 'lizard'].include?(choice_pair[1])
  when 'lizard' then ['spock', 'paper'].include?(choice_pair[1])
  when 'spock' then ['scissors', 'rock'].include?(choice_pair[1]) end
end

def prompt(message, *extra)
  puts "==> #{message}", *extra
end

def clear_screen
  system('clear') || system('clr')
end

def get_choice
  clear_screen()
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICE.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICE.include?(choice)
      break
    else
      prompt('That\'s not a valid choice.')
    end
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
  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('You lost!')
  else
    prompt("It's a tie!")
  end
end

def play_again?
  loop do
    prompt('Do you want to play again? Y/N')
    answer = gets.chomp.downcase
    return true if ['yes', 'y'].include?(answer)
    return false if ['no', 'n'].include?(answer)
    clear_screen()
    puts 'Oops. Please enter Yes or No.'
  end
end

loop do
  choice = get_choice()
  computer_choice = VALID_CHOICE.sample
  
  display_choices(choice, computer_choice)
  display_results(choice, computer_choice)

  break unless play_again?
end

prompt('Thank you for playing. Good bye!')
