import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mathbubble/game/bubble_game.dart';

import 'keypad.dart';

class PlayScreen extends StatelessWidget {
  final BubbleGame game;

  const PlayScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
      children: [
        Expanded(child: GameWidget(game: game)),
        NumberPad(
          onNumberChanged: (String value) {
            if (value != "") {
              int answer = int.parse(value);
              var problems = game.tryAnswer(answer);
              return problems != 0;
            }
            return false;
          },
        ),
      ],
    )));
  }
}
