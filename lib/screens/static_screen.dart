import 'package:flutter/material.dart';
import 'package:gdsc_flutter_workshop/screens/high_scores.dart';
import 'package:gdsc_flutter_workshop/widgets/tictactoe.dart';

class StaticScreen extends StatelessWidget {
  const StaticScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poke-tac-toe!"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const TicTacToe(),
          OutlinedButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HighScores(),
              ),
            ),
            child: Text("View High Scores"),
          ),
        ],
      ),
    );
  }
}
