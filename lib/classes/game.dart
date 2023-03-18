class Game {
  static List<bool?> board = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];
  static bool currentTurn = true;

  static bool hasWon(bool b) {
    const List<List<int>> winningCombos = [
      // // horizontal
      // [0, 1, 2],
      // [3, 4, 5],
      // [6, 7, 8],
      // // vertical
      // [0, 3, 6],
      // [1, 4, 7],
      // [2, 5, 8],
      // // diagonal
      // [0, 4, 8],
      // [2, 4, 6],
    ];
    for (int i = 0; i < winningCombos.length; i++) {
      List<int> check = winningCombos[i];
      if (board[check[0]] == b &&
          board[check[1]] == b &&
          board[check[2]] == b) {
        return true;
      }
    }
    return false;
  }

  static get isTied {
    for (int i = 0; i < 9; i++) {
      if (board[i] == null) {
        return false;
      }
    }
    return true;
  }
}
