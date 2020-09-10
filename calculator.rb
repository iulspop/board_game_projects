def prompt(message)
  puts "=> #{message}"
end

prompt('Simple Arithmetic Calculor')

operation = ''
loop do
  prompt("What operation would you like to perfom?
   1) add 2) substract 3) multiply 4) divide")
  operation = gets.chomp

  if %w[1 2 3 4].include?(operation) then break
  else prompt('Invalid input. Please enter either 1, 2, 3 or 4.') end
end

prompt("What's the first number?")
num1 = gets.chomp.to_i

num2 = 0
loop do
  prompt("What's the second number?")
  num2 = gets.chomp.to_i
  next prompt('Cannot divide by 0') if operation == 'divide' && num2.zero?

  break
end

result = case operation
         when '1' then num1 + num2
         when '2' then num1 - num2
         when '3' then num1 * num2
         when '4' then num1 / num2 end

prompt("The result is: #{result}")
