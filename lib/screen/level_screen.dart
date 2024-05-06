import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../maths/level_controller.dart';

class LevelScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LevelScreenState();
}

class LevelScreenState extends State<LevelScreen> {
  final LevelController levelController = LevelController();
  late SharedPreferences _prefs;
  int level = 1;

  @override
  void initState() {
    super.initState();
    _initPrefs();
  }

  _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _loadLevel();
  }

  _loadLevel() {
    setState(() {
      level = _prefs.getInt('level') ?? 1;
    });
  }

  _saveLevel(int value) {
    _prefs.setInt('level', value);
    setState(() {
      level = value;
    });
  }

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
                    onTap: () => {_saveLevel(index + 1)},
                    selected: level == index + 1,
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
