require 'io/console'

RULES_MESSAGE = <<-MSG
The rules are: 
    Two players, X and O, take turns marking the spaces in a 3×3 grid. 

    The player who succeeds in placing three of their marks
    in a horizontal, vertical, or diagonal row wins the round.

    The first to win three rounds wins the game!
MSG

def prompt(message, *extra)
  puts "==> #{message}", *extra
end

def clear_screen
  system('clear') || system('clr')
end

def any_key_to_continue(message)
  prompt message
  STDIN.getch
end

def welcome
  clear_screen()
  sleep 0.4
  puts 'Let\'s play Tic Tac Toe!', ''

  sleep 0.4
  prompt RULES_MESSAGE, ''

  any_key_to_continue('Press any key to start playing...')
end

welcome()

=begin
welcome
assign X or O to player
if play X, O to computer

if player X, display board, ask for input
if player O, display board, ask any key for computer to play

after player play, check win, check full -> line 7
after computer play, check win, check full -> line 6

after win or tie, display winner, continue?

goodbye

Welcome
begin loop
  Set Score

  begin loop
    Assign randomly X or O for player

    begin loop
      Display board
      Display what players symbols
      Ask for player to mark a square or any key for computer to mark square
      Check win or fill
      update initiative
    end

    Display round winner
    Update score
    Win Game?
  end

  Play again?
  Goobye
=end
