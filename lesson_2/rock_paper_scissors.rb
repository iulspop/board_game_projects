VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message, *extra)
  puts "==> #{message}", *extra
end

def clear_screen
  system('clear') || system('clr')
end

def display_results(player, computer)
  choices = player + ' ' + computer
  if ['rock scissors', 'paper rock', 'scissors paper'].include?(choices)
    prompt('You won!')
  elsif ['scissors rock', 'rock paper', 'paper scissors'].include?(choices)
    prompt('You lost!')
  else
    prompt("It's a tie!")
  end
end

loop do
  clear_screen()
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt('That\'s not a valid choice.')
    end
  end

  computer_choice = %w[rock paper scissors].sample

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)
  prompt('Do you want to play again')
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt('Thank you for playing. Good bye!')
