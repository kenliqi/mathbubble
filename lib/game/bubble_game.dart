import 'dart:math';

import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mathbubble/maths/problem_controller.dart';

import 'boundary.dart';
import 'bubble.dart';
import 'bubble_controller.dart';

class BubbleGame extends Forge2DGame {
  int level;
  final Random random = Random();

  BubbleGame({required this.level});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    debugPrint('loading the problem data set');
    final String data = await rootBundle.loadString('assets/problems.txt');
    final ProblemController problemController = ProblemController(data: data);
    // camera.viewport.add(FpsTextComponent());
    debugPrint('finish loading the problem data');
    final bubble_controller = BubbleController(
        level: level, problemController: problemController, interval: 2);
    world.add(bubble_controller);
    // world.add(Ball(initialPosition: getRandomBallPosition()));
    world.addAll(Boundary.createBoundaries(
        visibleRect: camera.visibleWorldRect, heightScale: 1.0));
  }

  void setLevel(int newLevel) {
    level = newLevel;
    final bubbleCtrls = world.children.query<BubbleController>();
    for (final c in bubbleCtrls) {
      c.setLevel(newLevel);
      print(
          'found one bubble conntroller to override the level to ${newLevel}');
    }
  }

  int tryAnswer(int answer) {
    final allBubbles = world.children.query<Bubble>();
    int count = 0;
    for (final b in allBubbles) {
      if (b.answer == answer) {
        count += 1;
        world.remove(b);
        break;
      }
    }
    return count;
  }

  int destroyAll() {
    var bubbles = world.children.query<Bubble>();
    for (final b in bubbles) {
      world.remove(b);
    }
    return bubbles.length;
  }

  Vector2 getRandomBallPosition() {
    final y = camera.visibleWorldRect.top - 10;
    final leftX = camera.visibleWorldRect.left;
    final rightX = camera.visibleWorldRect.right;
    final x = random.nextDouble() * (rightX - leftX) + leftX;
    // print('ball pos $x, $y');
    return Vector2(x, y);
  }
}
