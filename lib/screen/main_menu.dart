import 'package:flutter/material.dart';
import 'package:mathbubble/screen/play_screen.dart';

import 'level_screen.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainMenuStateful();
  }
}

class MainMenuStateful extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PlayScreen()));
              },
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: ElevatedButton(
              child: const Text('Levels'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LevelScreen()));
              },
            ),
          )
        ],
      ),
    ));
  }
}
