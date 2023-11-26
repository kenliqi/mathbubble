import 'package:flutter/material.dart';

import '../maths/level_controller.dart';

class LevelScreen extends StatelessWidget {
  final LevelController levelController;

  const LevelScreen({super.key, required this.levelController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            leading: const Icon(Icons.gamepad),
            title: Text('Level ${index + 1}'),
            subtitle: Text(levelController.getLevel(index + 1)!.description),
          ),
        );
      }),
    );
  }
}
