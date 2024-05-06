import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mathbubble/game/bubble_game.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'keypad.dart';

class PlayScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PlayScreenState();
}

class PlayScreenState extends State<PlayScreen> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _levelFuture;

  @override
  void initState() {
    super.initState();
    _levelFuture = _prefs.then((SharedPreferences prefs) {
      return prefs.getInt('level') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bubble Game'),
        ),
        body: Center(
            child: FutureBuilder<int>(
                future: _levelFuture,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return const CircularProgressIndicator();
                    case ConnectionState.active:
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final game = BubbleGame(level: snapshot.data ?? 0);
                        debugPrint('Current level is ${game.level}');
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
                })));
  }
}
