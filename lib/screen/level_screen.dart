import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:mathbubble/game/bubble_game.dart';

import '../maths/level_controller.dart';

class LevelScreen extends StatelessWidget {
  final LevelController levelController;
  final BubbleGame game;

  const LevelScreen(
      {super.key, required this.levelController, required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select levels'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.gamepad),
                    title: Text('Level ${index + 1}'),
                    subtitle:
                        Text(levelController.getLevel(index + 1)!.description),
                    onTap: () => {game.setLevel(index + 1)},
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          BackButton(
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
