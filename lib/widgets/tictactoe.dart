// import 'package:flutter/material.dart';

// class TicTacToe extends StatefulWidget {
//   const TicTacToe({super.key});

//   @override
//   State<TicTacToe> createState() => _TicTacToeState();
// }

// class _TicTacToeState extends State<TicTacToe> {
//   bool turn = true;
//   List<bool?> board = [];

//   @override
//   void initState() {
//     for (int i = 0; i < 9; i++) {
//       board.add(null);
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Table(
//       border: TableBorder.all(width: 3),
//       children: [
//         TableRow(children: [
//           TableCell(child: slot(0)),
//           TableCell(child: slot(1)),
//           TableCell(child: slot(2)),
//         ]),
//         TableRow(children: [
//           TableCell(child: slot(3)),
//           TableCell(child: slot(4)),
//           TableCell(child: slot(5)),
//         ]),
//         TableRow(children: [
//           TableCell(child: slot(6)),
//           TableCell(child: slot(7)),
//           TableCell(child: slot(8)),
//         ]),
//       ],
//     );
//   }

//   bool hasWonGame(bool b) {
//     const List<List<int>> winningCombos = [
//       // horizontal
//       [0, 1, 2],
//       [3, 4, 5],
//       [6, 7, 8],
//       // vertical
//       [0, 3, 6],
//       [1, 4, 7],
//       [2, 5, 8],
//       // diagonal
//       [0, 4, 8],
//       [2, 4, 6],
//     ];
//     for (int i = 0; i < winningCombos.length; i++) {
//       List<int> check = winningCombos[i];
//       if (board[check[0]] == b &&
//           board[check[1]] == b &&
//           board[check[2]] == b) {
//         return true;
//       }
//     }
//     return false;
//   }

//   Future<void> evaluateGame() async {
//     if (hasWonGame(turn)) {
//       return await showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (context) => AlertDialog(
//           title: Text("Congratulations!"),
//           content:
//               Text((turn ? "Pikachu" : "Bulbasaur") + " has won the game!"),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 setState(() {
//                   for (int i = 0; i < 9; i++) {
//                     board[i] = null;
//                   }
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text("PLAY AGAIN"),
//             ),
//           ],
//         ),
//       );
//     }
//     turn = !turn;
//   }

//   // pikachu = true, bulbasaur = false
//   Widget slot(int i) {
//     return InkWell(
//       onTap: () async {
//         if (board[i] != null) {
//           return await showDialog(
//             context: context,
//             builder: (context) => AlertDialog(
//               title: Text("Not allowed"),
//               content: Text("This slot is taken"),
//               actions: [
//                 TextButton(
//                   onPressed: () => Navigator.of(context).pop(),
//                   child: Text("RETURN"),
//                 ),
//               ],
//             ),
//           );
//         }
//         setState(() {
//           board[i] = turn;
//         });
//         return await evaluateGame();
//       },
//       child: board[i] == null
//           ? const SizedBox(
//               height: 150,
//             )
//           : Image.asset(
//               board[i] == true
//                   ? 'assets/pikachu.webp'
//                   : 'assets/bulbasaur.webp',
//               height: 150,
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<bool?> board = [];
  bool currentTurn = true;

  @override
  void initState() {
    for (int i = 0; i < 9; i++) {
      board.add(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(width: 3),
      children: [
        TableRow(children: [
          TableCell(child: slot(0)),
          TableCell(child: slot(1)),
          TableCell(child: slot(2)),
        ]),
        TableRow(children: [
          TableCell(child: slot(3)),
          TableCell(child: slot(4)),
          TableCell(child: slot(5)),
        ]),
        TableRow(children: [
          TableCell(child: slot(6)),
          TableCell(child: slot(7)),
          TableCell(child: slot(8)),
        ]),
      ],
    );
  }

  bool hasWonGame(bool b) {
    const List<List<int>> winningCombos = [
      // horizontal
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      // vertical
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      // diagonal
      [0, 4, 8],
      [2, 4, 6],
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

  tie() {
    for (int i = 0; i < 9; i++) {
      if (board[i] == null) {
        return false;
      }
    }
    return true;
  }

  evaluateGame() async {
    if (hasWonGame(currentTurn)) {
      return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: Text("Congratulations!"),
          content: Text(
            (currentTurn ? "Pikachu" : "Bulbasaur") + " has won the game!",
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  for (int i = 0; i < 9; i++) {
                    board[i] = null;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text("PLAY AGAIN"),
            ),
          ],
        ),
      );
    }
    if (tie()) {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Tie"),
          content: Text(":("),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  for (int i = 0; i < 9; i++) {
                    board[i] = null;
                  }
                });
                Navigator.of(context).pop();
              },
              child: Text("PLAY AGAIN"),
            ),
          ],
        ),
      );
    }
    currentTurn = !currentTurn;
  }

  // pikachu = true, bulbasaur = false
  Widget slot(int i) {
    return InkWell(
      onTap: () {
        if (board[i] != null) {
          return;
        }
        setState(() {
          board[i] = currentTurn;
        });
        return evaluateGame();
      },
      child: board[i] == null
          ? const SizedBox(
              height: 150,
            )
          : Image.asset(
              board[i] == true
                  ? 'assets/pikachu.webp'
                  : 'assets/bulbasaur.webp',
              height: 150,
            ),
      // onTap: () async {
      //   if (board[i] != null) {
      //     return await showDialog(
      //       context: context,
      //       builder: (context) => AlertDialog(
      //         title: Text("Not allowed"),
      //         content: Text("This slot is taken"),
      //         actions: [
      //           TextButton(
      //             onPressed: () => Navigator.of(context).pop(),
      //             child: Text("RETURN"),
      //           ),
      //         ],
      //       ),
      //     );
      //   }
      //   setState(() {
      //     board[i] = turn;
      //   });
      //   return await evaluateGame();
      // },
      // child: board[i] == null
      //     ? const SizedBox(
      //         height: 150,
      //       )
      //     : Image.asset(
      //         board[i] == true
      //             ? 'assets/pikachu.webp'
      //             : 'assets/bulbasaur.webp',
      //         height: 150,
      //       ),
    );
  }
}
