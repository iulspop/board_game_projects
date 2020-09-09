puts "==== Simple Arithmetic Calculor ===="

operation = ""
loop do
  puts "Enter operation to perform (add, substract, multiply or divide) >>"
  operation = gets.chomp
  break if ['add', 'substact', 'multiply', 'divide'].include?(operation)
  puts "Invalid input. Please try again."
end

puts "Enter first number >>"
num1 = gets.chomp.to_i

num2 = 0
loop do
  puts "Enter second number >>"
  num2 = gets.chomp.to_i
  next puts("Cannot divide by 0") if operation == "divide" && num2 == 0
  break 
end


result = case operation
  when "add"      then num1 + num2
  when "substact" then num1 - num2
  when "multiply" then num1 * num2
  when "divide"   then num1 / num2 end

puts "The result is: #{result}"
