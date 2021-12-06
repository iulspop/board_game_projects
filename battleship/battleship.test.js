const { Square, Ship, Board } = require('./battleship.js');

describe("Square", () => {
  test('Given a new square that is hit, isHit returns true', () => {
    let square = new Square([1,2]);
    square.markHit();
    expect(square.isHit()).toEqual(true);
  });

  test('getCoordinate returns coordinate', () => {
    let square = new Square([1,2]);
    expect(square.getCoordinate()).toEqual([1,2]);
  });
})

describe("Ship", () => {
  test('If a square exists with the coordinate for that Ship, return true', () => {
    let carrier = new Ship("carrier", [new Square([0, 0]), new Square([0, 1]), new Square([0, 2]), new Square([0, 3], new Square([0, 4]))]);
    expect(carrier.hasCoordinate([0, 0])).toEqual(true);
  });

  test('If a square does not exists with the coordinate for that Ship, return falase', () => {
    let carrier = new Ship("carrier", [new Square([0, 0]), new Square([0, 1]), new Square([0, 2]), new Square([0, 3], new Square([0, 4]))]);
    expect(carrier.hasCoordinate([5, 0])).toEqual(false);
  });
})

describe("Board", () => {
  test('Given a board, if I shoot at a coordinate with no ship return miss', () => {
    let carrier = new Ship("carrier", [new Square([0, 0]), new Square([0, 1]), new Square([0, 2]), new Square([0, 3], new Square([0, 4]))]);
    let battleship = new Ship("battleship", [new Square([1, 0]), new Square([1, 1]), new Square([1, 2]), new Square([1, 3])]);
    let cruiser = new Ship("cruiser", [new Square([2, 0]), new Square([2, 1]), new Square([2, 2])]);
    let submarine = new Ship("submarine", [new Square([3, 0]), new Square([3, 1]), new Square([3, 2])]);
    let destroyer = new Ship("destroyer", [new Square([4, 0]), new Square([4, 1]), new Square([4, 2])]);
    let board = new Board([carrier, battleship, cruiser, submarine, destroyer]);

    expect(board.shoot([9, 9])).toEqual({status: "miss"});
  })

  test('Given a board, if I shoot at a coordinate with ship return hit', () => {
    let carrier = new Ship("carrier", [new Square([0, 0]), new Square([0, 1]), new Square([0, 2]), new Square([0, 3], new Square([0, 4]))]);
    let battleship = new Ship("battleship", [new Square([1, 0]), new Square([1, 1]), new Square([1, 2]), new Square([1, 3])]);
    let cruiser = new Ship("cruiser", [new Square([2, 0]), new Square([2, 1]), new Square([2, 2])]);
    let submarine = new Ship("submarine", [new Square([3, 0]), new Square([3, 1]), new Square([3, 2])]);
    let destroyer = new Ship("destroyer", [new Square([4, 0]), new Square([4, 1]), new Square([4, 2])]);
    let board = new Board([carrier, battleship, cruiser, submarine, destroyer]);

    expect(board.shoot([0, 0])).toEqual({status: "hit"});
  })

  test('Given that I shot all sqaures for a ship, return sunk', () => {
    let carrier = new Ship("carrier", [new Square([0, 0]), new Square([0, 1]), new Square([0, 2]), new Square([0, 3], new Square([0, 4]))]);
    let battleship = new Ship("battleship", [new Square([1, 0]), new Square([1, 1]), new Square([1, 2]), new Square([1, 3])]);
    let cruiser = new Ship("cruiser", [new Square([2, 0]), new Square([2, 1]), new Square([2, 2])]);
    let submarine = new Ship("submarine", [new Square([3, 0]), new Square([3, 1]), new Square([3, 2])]);
    let destroyer = new Ship("destroyer", [new Square([4, 0]), new Square([4, 1]), new Square([4, 2])]);
    let board = new Board([carrier, battleship, cruiser, submarine, destroyer]);

    board.shoot([4,0]);
    board.shoot([4,1]);
    expect(board.shoot([4,2])).toEqual({status: "sunk", name: "destroyer"});
  })
});