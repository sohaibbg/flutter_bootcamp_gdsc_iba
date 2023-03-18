import 'package:flutter/material.dart';

import '../classes/game.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
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

  next() async {
    if (Game.hasWon(Game.currentTurn)) {
      return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          title: const Text("Congratulations!"),
          content: Text(
            "${Game.currentTurn ? "Pikachu" : "Bulbasaur"} has won the game!",
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  for (int i = 0; i < 9; i++) {
                    Game.board[i] = null;
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text("PLAY AGAIN"),
            ),
          ],
        ),
      );
    }
    if (Game.isTied) {
      return await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Tie"),
          content: const Text(":("),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  for (int i = 0; i < 9; i++) {
                    Game.board[i] = null;
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text("PLAY AGAIN"),
            ),
          ],
        ),
      );
    }
    Game.currentTurn = !Game.currentTurn;
  }

  // pikachu = true, bulbasaur = false
  Widget slot(int i) => InkWell(
        onTap: () {
          if (Game.board[i] != null) return;
          setState(() => Game.board[i] = Game.currentTurn);
          next();
        },
        child: Game.board[i] == null
            ? const SizedBox(
                height: 150,
              )
            : Image.asset(
                Game.board[i] == true
                    ? 'assets/pikachu.webp'
                    : 'assets/bulbasaur.webp',
                height: 150,
              ),
      );
}
