def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  !num.match?(/[^0-9]/)
end

def operation_to_message(op)
  case op
  when '1' then 'Adding'
  when '2' then 'Subtracting'
  when '3' then 'Multiplying'
  when '4' then 'Dividing' end
end

prompt('Simple Arithmetic Calculor')

operator_prompt = <<-MSG
What operation would you like to perfom?
   1) add 
   2) substract
   3) multiply 
   4) divide
MSG

loop do
  operator = ''
  loop do
    prompt(operator_prompt)
    operator = gets.chomp

    if %w[1 2 3 4].include?(operator) then break
    else prompt('Must choose 1, 2, 3 or 4') end
  end

  num1 = 0
  loop do
    prompt('What\'s the first number?')
    num1 = gets.chomp

    if valid_number?(num1) then break num1 = num1.to_f
    else prompt('Oops. Please enter only number') end
  end

  num2 = 0
  loop do
    prompt('What\'s the second number?')
    num2 = gets.chomp

    if valid_number?(num2) then break num2 = num2.to_f
    else prompt('Oops. Please enter only a number') end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1' then num1 + num2
           when '2' then num1 - num2
           when '3' then num1 * num2
           when '4' then num1 / num2 end

  prompt("The result is: #{result}")

  prompt("Would you like to run a calculation again? (Y to calculate again)")
  break unless gets.chomp.upcase.start_with?('Y')
end

puts "Thank you for using the calculator. Good bye!"