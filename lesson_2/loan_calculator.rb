require 'io/console'

def prompt(message, *extra)
  puts "==> #{message}", *extra
end

def clear_screen
  system('clear') || system('clr')
end

def valid_positive_number?(string)
  string.match?(/\A[0-9]+(.[0-9]+)?\z/)
end

def valid_integer?(string)
  string.match?(/\A[0-9]+\z/)
end

def welcome
  clear_screen()
  puts 'Welcome to Loan Calculator Utility!', ''
  sleep 0.15

  prompt 'Calculate the monthly payments of a loan with this tool.'
  prompt(
    <<-MSG
You will need the loan's: 
     1) Total amount
     2) Duration
     3) APR (Annual Percentage Rate)
  MSG
  )

  print "\n"
  prompt 'Press any key to continue...'
  STDIN.getch
end

def get_loan_amount
  clear_screen()
  loan_amount = 0
  loop do
    prompt 'Please enter the total loan amount:'
    loan_amount = gets.chomp

    break if valid_positive_number?(loan_amount) && loan_amount.to_f > 0
    clear_screen()
    puts 'Oops. The amount should be greater than 0.'
  end
  loan_amount.to_f
end

def get_loan_duration_in_months
  clear_screen()
  years = 0
  months = 0

  loop do
    loop do
      prompt 'How many years long is the loan? (Zero if less than a year)'
      years = gets.chomp

      break if valid_integer?(years)
      clear_screen()
      puts 'Oops. The number of years should be a whole number.'
    end

    clear_screen()
    loop do
      prompt 'How many additional months long is the loan?'
      months = gets.chomp

      break if valid_integer?(months)
      clear_screen()
      puts 'Oops. The number of months should be a whole number.'
    end

    break if years.to_i != 0 || months.to_i != 0
    clear_screen()
    puts 'Oops. The loan duration cannot be 0 years long and 0 months long.'
  end

  years.to_i * 12 + months.to_i
end

def apr_to_monthly_rate_as_decimal(apr)
  apr / 12 / 100
end

def get_apr
  clear_screen()
  apr = 0
  loop do
    prompt 'What is the loan\'s APR as a percentage?'
    apr = gets.chomp

    break if valid_positive_number?(apr)
    clear_screen()
    puts 'Oops. The percentage should be a positive number.'
  end
  apr.to_f
end

def calculate_monthly_payment(loan_amount, months, monthly_rate)
  loan_amount * (monthly_rate / (1 - (1 + monthly_rate)**(-months)))
end

def continue?
  sleep 0.15
  prompt('Would you like to calculate loan payments again? Y/N')
  answer = gets.chomp
  ['Y', 'y'].include?(answer)
end

loop do
  welcome()
  loan_amount = get_loan_amount
  months = get_loan_duration_in_months
  monthly_rate = apr_to_monthly_rate_as_decimal(get_apr)

  monthly_payment =
    calculate_monthly_payment(loan_amount, months, monthly_rate).round(2)

  clear_screen()
  prompt "The monthly payment on this loan would be $#{monthly_payment} for" \
  " #{months} months.", ''
  break unless continue?
end
