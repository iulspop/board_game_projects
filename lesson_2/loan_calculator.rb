require 'io/console'

def prompt(message)
  puts "==> #{message}"
end

def clear_screen
  system('clear') || system('clr')
end

def valid_positive_number?(num)
  num.match?(/\A[0-9]+(.[0-9]+)?\z/)
end

def welcome
  puts 'Loan Calculator Utility'
  sleep 0.15
  
  prompt 'Welcome!'
  prompt 'Calculate the monthly payments of a loan with this tool.'
  prompt(
  <<-MSG
  You will need: 
      1) Total loan amount
      2) Loan duration
      3) Annual Percentage Rate (APR)
  MSG
  )
  
  prompt('Press any key to continue...')
  STDIN.getch
end

def get_loan_amount
  loan_amount = ''
  loop do
    prompt('Please enter the total loan amount:')
    loan_amount = gets.chomp

    break if valid_positive_number?(loan_amount) && loan_amount.to_f > 0
    prompt('Oops. The amount should be greater than 0.')
  end
  loan_amount.to_f
end
  
clear_screen()
welcome()

clear_screen()
loan_amount = get_loan_amount

  # monthly_payment = 
# loan_amount * (monthly_interest / (1 - (1 + monthly_interest)**(-months)))
