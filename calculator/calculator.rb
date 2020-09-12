require 'yaml'

def translate(default_message, translations = nil, message_key = nil, language = nil)
  if translations
    translated_message = translations[message_key][language]
    puts "==> #{translated_message}"
  else
    puts "==> #{default_message}"
  end
end

def valid_number?(num)
  num.match?(/\A-?[0-9]+(.[0-9]+)?\z/)
end

def operation_to_message(operator)
  message = case operator
            when '1' then 'Adding'
            when '2' then 'Subtracting'
            when '3' then 'Multiplying'
            when '4' then 'Dividing' end
end

begin
  translations = YAML.load_file('calculator_messages.yml')
rescue Errno::ENOENT
  puts "Did not find language file. Using default english messages."
  skip_language_prompt = true
end

unless skip_language_prompt
  language = ''
  loop do
    translate('Language? Enter EN or FR')
    language = gets.chomp.upcase
    break if ['EN', 'FR'].include?(language)
    translate('Oops. Please enter a valid language')
  end
end

translate('Simple Arithmetic Calculator', translations, 'greeting', language)

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
    translate(operator_prompt, translations, 'operator_prompt', language)
    operator = gets.chomp

    if %w[1 2 3 4].include?(operator) then break
    else translate('Must choose 1, 2, 3 or 4') end
  end

  num1 = 0
  loop do
    translate('What\'s the first number?')
    num1 = gets.chomp

    if valid_number?(num1) then break num1 = num1.to_f
    else translate('Oops. Please enter a valid number') end
  end

  num2 = 0
  loop do
    translate('What\'s the second number?')
    num2 = gets.chomp

    if valid_number?(num2) then break num2 = num2.to_f
    else translate('Oops. Please enter a valid number') end
  end

  translate("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1' then num1 + num2
           when '2' then num1 - num2
           when '3' then num1 * num2
           when '4' then num1 / num2 end

  translate("The result is: #{result}")

  translate("Would you like to run a calculation again? (Y to calculate again)")
  break unless gets.chomp.upcase.start_with?('Y')
end

puts "Thank you for using the calculator. Good bye!"
