const readline = require("readline-sync");

class Square {
  constructor(coordinate) {
    this.coordinate = coordinate;
    this.hit = false;
  }

  isHit() {
    return this.hit;
  }

  markHit() {
    this.hit = true;
  }

  getCoordinate() {
    return this.coordinate;
  }
}

class Ship {
  constructor(name, squares) {
    this.name = name;
    this.squares = squares;
  }

  hit(coordinate) {
    this.squares.forEach(square => {
      if (square.coordinate.toString() === coordinate.toString()) {
        square.markHit();
      }
    })
  }

  isSunk() {
    return this.squares.every(square => square.isHit());
  }

  getName() {
    return this.name;
  }

  getSquare() {
    return this.square;
  }

  hasCoordinate(coordinate) {
    return this.squares.some(square => {
      return square.coordinate[0] === coordinate[0] && square.coordinate[1] === coordinate[1];
    });
  }
}

class Board {
  constructor(ships) {
    this.ships = ships;
  }

  shoot(coordinate) {
    for (let i = 0; i < this.ships.length; i++) {
      let ship = this.ships[i];
      if (ship.hasCoordinate(coordinate)) {
        ship.hit(coordinate)
        let sunk = ship.isSunk();
        if (sunk) {
          return {status: "sunk", name: ship.getName()};
        } else {
          return {status: "hit"};
        };
      }
    }

    return {status: "miss"};
  }

  allShipsAreSunk() {
    return this.ships.every(ship => ship.isSunk());
  }
}

class Game {
  constructor() {
    let carrier = new Ship("carrier", [new Square([0, 0]), new Square([0, 1]), new Square([0, 2]), new Square([0, 3], new Square([0, 4]))]);
    let battleship = new Ship("battleship", [new Square([1, 0]), new Square([1, 1]), new Square([1, 2]), new Square([1, 3])]);
    let cruiser = new Ship("cruiser", [new Square([2, 0]), new Square([2, 1]), new Square([2, 2])]);
    let submarine = new Ship("submarine", [new Square([3, 0]), new Square([3, 1]), new Square([3, 2])]);
    let destroyer = new Ship("destroyer", [new Square([4, 0]), new Square([4, 1]), new Square([4, 2])]);

    this.board = new Board([carrier, battleship, cruiser, submarine, destroyer]);
  }

  play() {
    while (true) {
      console.log("Shoot!")
      let coordX = readline.question('Give X coordinate:\n');
      let coordY = readline.question('Give Y coordinate:\n');
      let message = this.board.shoot([Number(coordX), Number(coordY)]);
      console.log(message.status);
      if (this.board.allShipsAreSunk()) {
        console.log('You won! All ship sunk!');
        break;
      }
    }
  }
}

let game = new Game;
game.play();




// -----00000
// ----000000
// ---0000000
// ---0000000
// --00000000






// class Player {
//   constructor() {
//     // pastShots
//   }

//   shoot(board, coordinate) {
//     board.shoot(coordinate)
//   }
// }

module.exports = { Square, Ship, Board };