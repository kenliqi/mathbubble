import 'package:flutter/material.dart';
import 'package:mathbubble/maths/level_controller.dart';
import 'package:mathbubble/screen/level_screen.dart';
import 'package:mathbubble/screen/play_screen.dart';

import '../game/bubble_game.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Text(
              "Crazy Maths",
              style: TextStyle(fontSize: 50, color: Colors.white, shadows: [
                Shadow(
                    blurRadius: 20.0, color: Colors.white, offset: Offset(0, 0))
              ]),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              child: const Text('Play'),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => PlayScreen(game: BubbleGame())));
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              child: const Text('Levels'),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) =>
                        LevelScreen(levelController: LevelController())));
              },
            ),
          )
        ],
      ),
    ));
  }
}
