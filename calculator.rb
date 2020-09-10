def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num != 0
end

prompt('Simple Arithmetic Calculor')

loop do
  operation = ''
  loop do
    prompt('What operation would you like to perfom?
    1) add 2) substract 3) multiply 4) divide')
    operation = gets.chomp

    if %w[1 2 3 4].include?(operation) then break
    else prompt('Invalid input. Please enter either 1, 2, 3 or 4.') end
  end

  num1 = 0
  loop do
    prompt('What\'s the first number?')
    num1 = gets.chomp.to_i

    if valid_number?(num1) then break
    else prompt('Please enter a natural number except for 0') end
  end

  num2 = 0
  loop do
    prompt('What\'s the second number?')
    num2 = gets.chomp.to_i

    if valid_number?(num2) then break
    else prompt('Please enter a natural number except for 0') end
  end

  result = case operation
           when '1' then num1 + num2
           when '2' then num1 - num2
           when '3' then num1 * num2
           when '4' then num1 / num2 end

  prompt("The result is: #{result}")

  prompt("Would you like to run a calculation again? (Y to calculate again)")
  break unless gets.chomp.upcase.start_with?('Y')
end
