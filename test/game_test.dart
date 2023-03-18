import 'package:flutter_test/flutter_test.dart';
import 'package:gdsc_flutter_workshop/classes/game.dart';

void main() {
  test('Horizontal wins', () {
    Game.board = [
      true,
      true,
      true,
      null,
      null,
      null,
      null,
      null,
      null,
    ];
    expect(Game.hasWon(true), true);
  });
}
