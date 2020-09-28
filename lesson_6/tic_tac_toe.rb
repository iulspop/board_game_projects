require 'io/console'

BOARD = [
  ['','',''],
  ['','',''],
  ['','','']
]

TICTACTOE = <<-MSG
        88                                                                          
  ,d    ""              ,d                            ,d                            
  88                    88                            88                            
MM88MMM 88  ,adPPYba, MM88MMM ,adPPYYba,  ,adPPYba, MM88MMM ,adPPYba,    ,adPPYba,  
  88    88 a8"     ""   88    ""     `Y8 a8"     ""   88   a8"     "8a  a8P_____88  
  88    88 8b           88    ,adPPPPP88 8b           88   8b       d8  8PP"""""""  
  88,   88 "8a,   ,aa   88,   88,    ,88 "8a,   ,aa   88,  "8a,   ,a8"  "8b,   ,aa  
  "Y888 88  `"Ybbd8"'   "Y888 `"8bbdP"Y8  `"Ybbd8"'   "Y888 `"YbbdP"'    `"Ybbd8"'  
MSG

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
  puts TICTACTOE, ''

  sleep 0.4
  prompt RULES_MESSAGE, ''

  any_key_to_continue('Press any key to start playing...')
end

welcome()
loop do
  eat
end

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

____________
|          |
|          |
|          |
|          |
|          |
____________

__________
| \    / |
|  \  /  |
|   \/   |
|   /\   |
|  /  \  |
| /    \ |
__________
__________
|        |
|        |
|        |
|        |
|        |
|        |
__________
__________
|        |
|        |
|        |
|        |
|        |
|        |
__________


__________________________________
|          |          |          |
|          |          |          |
|          |          |          |
|          |          |          |
|          |          |          |
__________________________________



          |          |          
          |          |          
          |          |          
          |          |          
          |          |          
________________________________
          |          |          
          |          |          
          |          |          
          |          |          
          |          |          
________________________________
          |          |          
          |          |          
          |          |          
          |          |          
          |          |          


__________________________________
|\        /|          |          |
| \      / |          |          |
|       /  |          |          |
|          |          |          |
|          |          |          |
__________________________________
|          |          |          |
|          |          |          |
|          |          |          |
|          |          |          |
|          |          |          |
__________________________________
|          |          |          |
|          |          |          |
|          |          |          |
|          |          |          |
|          |          |          |
__________________________________

=end