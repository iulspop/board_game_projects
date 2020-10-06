
# This program uses Bej's cards
# https://ascii.co.uk/art/cards
# In general if you use any part of this file please send me a note to
# bej@druid.if.uj.edu.pl just for my pleasure.
CLUBS = [
' _________ 
|A        |
|+   *    |
|    !    |
|  *-+-*  |
|    |    |
|   ~~~  +|
|        V|
 ~~~~~~~~~ ',
' _________ 
|K |/|\|  |
|+ /o,o\  |
|  \_-_/  |
| ~-_-~-_ |
|  /~-~\  |
|  \o`o/ +|
|  |\|/| X|
 ~~~~~~~~~ ',
' _________ 
|Q |~~~|  |
|+ /o,o\  |
|  \_-_/  |
| _-~+_-~ |
|  /~-~\  |
|  \o`o/ +|
|  |___| Q|
 ~~~~~~~~~ ',
' _________ 
|J /~~|_  |
|+ | o`,  |
|  | -|   |
| =~)+(_= |
|   |- |  |
|  `.o | +|
|  ~|__/ P|
 ~~~~~~~~~ ',
' _________ 
|10+   +  |
|+   +    |
|  +   +  |
|         |
|  +   +  |
|    +   +|
|  +   +0l|
 ~~~~~~~~~ ',
' _________ 
|9 +   +  |
|+        |
|  +   +  |
|    +    |
|  +   +  |
|        +|
|  +   + 6|
 ~~~~~~~~~ ',
' _________ 
|8 +   +  |
|+        |
|  +   +  |
|         |
|  +   +  |
|        +|
|  +   + 8|
 ~~~~~~~~~ ',
' _________ 
|7        |
|+ +   +  |
|    +    |
|  +   +  |
|         |
|  +   + +|
|        L|
 ~~~~~~~~~ ',
' _________ 
|6        |
|+ +   +  |
|         |
|  +   +  |
|         |
|  +   + +|
|        9|
 ~~~~~~~~~ ',
' _________ 
|5        |
|+        |
|  +   +  |
|    +    |
|  +   +  |
|        +|
|        S|
 ~~~~~~~~~ ',
' _________ 
|4        |
|+        |
|  +   +  |
|         |
|  +   +  |
|        +|
|        b|
 ~~~~~~~~~ ',
' _________ 
|3        |
|+   +    |
|         |
|    +    |
|         |
|    +   +|
|        E|
 ~~~~~~~~~ ',
' _________ 
|2        |
|+        |
|    +    |
|         |
|    +    |
|        +|
|        Z|
 ~~~~~~~~~ '
].reverse

DIAMONDS = [
' _________ 
|A        |
|O  /~\   |
|  / ^ \  |
| (     ) |
|  \ v /  |
|   \_/  O|
|        V|
 ~~~~~~~~~ ',
' _________ 
|K |/|\|  |
|O |o.o|  |
|   \v/   |
|  XXXXX  |
|   /^\   |
|  |o\'o| O|
|  |\|/| X|
 ~~~~~~~~~ ',
' _________ 
|Q |~~~|  |
|O |o.o|  |
|   \v/   |
|  XXOXX  |
|   /^\   |
|  |o\'o| O|
|  |___| Q|
 ~~~~~~~~~ ',
' _________ 
|J /~~|_  |
|O ( o\   |
|  ! \l   |
| ^^^Xvvv |
|   l\ I  |
|   \o ) O|
|  ~|__/ P|
 ~~~~~~~~~ ',
' _________ 
|10O   O  |
|O   O    |
|  O   O  |
|         |
|  O   O  |
|    O   O|
|  O   O0l|
 ~~~~~~~~~ ',
' _________ 
|9 O   O  |
|O        |
|  O   O  |
|    O    |
|  O   O  |
|        O|
|  O   O 6|
 ~~~~~~~~~ ',
' _________ 
|8 O   O  |
|O        |
|  O   O  |
|         |
|  O   O  |
|        O|
|  O   O 8|
 ~~~~~~~~~ ',
' _________ 
|7        |
|O O   O  |
|    O    |
|  O   O  |
|         |
|  O   O O|
|        L|
 ~~~~~~~~~ ',
' _________ 
|6        |
|O O   O  |
|         |
|  O   O  |
|         |
|  O   O O|
|        9|
 ~~~~~~~~~ ',
' _________ 
|5        |
|O        |
|  O   O  |
|    O    |
|  O   O  |
|        O|
|        S|
 ~~~~~~~~~ ',
' _________ 
|4        |
|O        |
|  O   O  |
|         |
|  O   O  |
|        O|
|        b|
 ~~~~~~~~~ ',
' _________ 
|3        |
|O   O    |
|         |
|    O    |
|         |
|    O   O|
|        E|
 ~~~~~~~~~ ',
' _________ 
|2        |
|O        |
|    O    |
|         |
|    O    |
|        O|
|        Z|
 ~~~~~~~~~ '
].reverse

HEARTS = [
' _________ 
|A        |
|# _   _  |
| / ~V~ \ |
| \ Bej / |
|  \ # /  |
|   `.\'  #|
|        V|
 ~~~~~~~~~ ',
' _________ 
|K |/|\|  |
|# %*,*%  |
|  \_o_/  |
| #>-=-<# |
|  /~o~\  |
|  %*\'*% #|
|  |\|/| X|
 ~~~~~~~~~ ',
' _________ 
|Q |~~~|  |
|# %*,*%  |
|  \_o_/  |
| -=<*>=- |
|  /~o~\  |
|  %*\'*% #|
|  |___| Q|
 ~~~~~~~~~ ',
' _________ 
|J /~~|_  |
|# % *`.  |
|  % <~   |
| %% / %% |
|   _> %  |
|  `,* % #|
|  ~|__/ P|
 ~~~~~~~~~ ',
' _________ 
|10#   #  |
|#   #    |
|  #   #  |
|         |
|  #   #  |
|    #   #|
|  #   #0l|
 ~~~~~~~~~ ',
' _________ 
|9 #   #  |
|#        |
|  #   #  |
|    #    |
|  #   #  |
|        #|
|  #   # 6|
 ~~~~~~~~~ ',
' _________ 
|8 #   #  |
|#        |
|  #   #  |
|         |
|  #   #  |
|        #|
|  #   # 8|
 ~~~~~~~~~ ',
' _________ 
|7        |
|# #   #  |
|    #    |
|  #   #  |
|         |
|  #   # #|
|        L|
 ~~~~~~~~~ ',
' _________ 
|6        |
|# #   #  |
|         |
|  #   #  |
|         |
|  #   # #|
|        9|
 ~~~~~~~~~ ',
' _________ 
|5        |
|#        |
|  #   #  |
|    #    |
|  #   #  |
|        #|
|        S|
 ~~~~~~~~~ ',
' _________ 
|4        |
|#        |
|  #   #  |
|         |
|  #   #  |
|        #|
|        b|
 ~~~~~~~~~ ',
' _________ 
|3        |
|#   #    |
|         |
|    #    |
|         |
|    #   #|
|        E|
 ~~~~~~~~~ ',
' _________ 
|2        |
|#        |
|    #    |
|         |
|    #    |
|        #|
|        Z|
 ~~~~~~~~~ '
].reverse

SPADES = [
' _________ 
|A        |
|@   *    |
|   / \   |
|  /_@_\  |
|    !    |
|   ~ ~  @|
|        V|
 ~~~~~~~~~ ',
' _________ 
|K |/|\|  |
|@ \- -/  |
| ! |-|   |
|  % I %  |
|   |-| ! |
|  /- -\ @|
|  |\|/| X|
 ~~~~~~~~~ ',
' _________ 
|Q |~~~|  |
|@ \- -/  |
| o |-|   |
|  I % I  |
|   |-| o |
|  /- -\ @|
|  |___| Q|
 ~~~~~~~~~ ',
' _________ 
|J /~~|_  |
|@ ! -\   |
|  \ -!   |
|  \',\\\',  |
|   I- \  |
|   \- I @|
|  ~|__/ P|
 ~~~~~~~~~ ',
' _________ 
|10@   @  |
|@   @    |
|  @   @  |
|         |
|  @   @  |
|    @   @|
|  @   @0l|
 ~~~~~~~~~ ',
' _________ 
|9 @   @  |
|@        |
|  @   @  |
|    @    |
|  @   @  |
|        @|
|  @   @ 6|
 ~~~~~~~~~ ',
' _________ 
|8 @   @  |
|@        |
|  @   @  |
|         |
|  @   @  |
|        @|
|  @   @ 8|
 ~~~~~~~~~ ',
' _________ 
|7        |
|@ @   @  |
|    @    |
|  @   @  |
|         |
|  @   @ @|
|        L|
 ~~~~~~~~~ ',
' _________ 
|6        |
|@ @   @  |
|         |
|  @   @  |
|         |
|  @   @ @|
|        9|
 ~~~~~~~~~ ',
' _________ 
|5        |
|@        |
|  @   @  |
|    @    |
|  @   @  |
|        @|
|        S|
 ~~~~~~~~~ ',
' _________ 
|4        |
|@        |
|  @   @  |
|         |
|  @   @  |
|        @|
|        b|
 ~~~~~~~~~ ',
' _________ 
|3        |
|@   @    |
|         |
|    @    |
|         |
|    @   @|
|        E|
 ~~~~~~~~~ ',
' _________ 
|2        |
|@        |
|    @    |
|         |
|    @    |
|        @|
|        Z|
 ~~~~~~~~~ '
].reverse

EMPTY_CARD = <<-MSG
 _________ 
|         |
|         |
|         |
|         |
|         |
|         |
|         |
 ~~~~~~~~~ 
MSG

EMPTY_SPACE = <<-MSG
           
           
           
           
           
           
           
           
           
MSG

DECK = [HEARTS, DIAMONDS, CLUBS, SPADES]