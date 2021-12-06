For the code challege we are going to create a simple version of the game 'Battleship'.

<!-- This is a game in which two players each have a 10x10 grid in which coordinates are marked with ships and players alternate turns calling coordinates out and calling 'hit' or 'miss' until one player has 'hit' all of the other players ships. -->

For our version, there will only be one grid, 10x10.  As the programmers, you will be placing the 'ships' in a manner of your choosing (predetermined, random, etc) and the player will input coordinates as a guess.  

You will occupy a total of 17 squares with your 'ships', representing the following
ships:
Carrier: 5 squares
Battleship: 4 squares
Cruiser: 3 squares
Submarine: 3 squares
Destroyer: 2 squares

The 'ships' cannot be placed diagonally or stacked on top of each other

The player has a maximum of 45 shots before they run out of ammo trying to sink the computers fleet.

Gameplay:

Initialize the board/fleet
Get a guess from the player
Tell player hit or miss
If a boat is sunk, tell player a boat is sunk and which one
If all boats are sunk, declare player the winner
If player is out of ammo, declare computer the winner

ADVANCED OPTIONS/THINGS TO CONSIDER:

Graphical/html vs command line
Keeping score with hits and trying to beat high score/fastest winner
Displaying the grid/fleet


RULES:
1. state of the game predetermined
2. grid 10/10 
3. game ends when a player hit all ship or the human player uses all their ammo
4. The 'ships' cannot be placed diagonally or stacked on top of each other
5. The player has a maximum of 45 shots before they run out of ammo 

NOUNS:
grid
coordinates
square/ size 
ship
name 
player
winner 

VERBS
marked
Initialize
get user input ?
shoot
sink

place

hit 
miss

Game
  player
  board

Player
  ammunition = 45
  pastShots = 0,1 missed; 4,5 hit, 5, 6 hit => sunk Destroyer

  shoot(board, coordinate)

Board
  constructor
    ships = [carrier, battleship, cruiser, submarine, destroyer]

  initAGrid
  hit(coordinate) => "hit" or "miss"

Ship 
  constructor()
  squares = [square1, [0,1], [0,2]]
  name: string

  hit(coordinate) => "hit" or "miss" or "sunk"
  isSunk => boolean

  getName
  getSquares

Square
  constructor(coordinate)

  coordinate: [0, 0]
  hit: false

  isHit
  markHit
  getCoordinate





How to check if a part of the board is taken by a ship?
    grid [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4]... [0, 9], [1, 0]] 

You will occupy a total of 17 squares with your 'ships', representing the following
ships:
Carrier: 5 squares
Battleship: 4 squares
Cruiser: 3 squares
Submarine: 3 squares
Destroyer: 2 squares

OOOOOOOOOO
OXOOOOOOOO
OXOOOOOOOO
OXOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
OOOOOOOOOO
OOXXXXXXOO
OOOOOOOOOO
OOOOOOOOOO