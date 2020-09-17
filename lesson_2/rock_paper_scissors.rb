VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message, *extra)
  puts "==> #{message}", *extra
end

def clear_screen
  system('clear') || system('clr')
end

def win?(first, second)
  choices = first + ' ' + second
  ['rock scissors', 'paper rock', 'scissors paper'].include?(choices)
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
