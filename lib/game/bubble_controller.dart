import 'dart:math';

import 'package:flame/components.dart';
import 'package:mathbubble/game/bubble_game.dart';

import '../maths/problem_controller.dart';
import 'bubble.dart';

class BubbleController extends Component with HasGameRef<BubbleGame> {
  int interval;
  int level = 1;
  late Timer spawnTimer;
  final Random random = Random();
  final ProblemController problemController;

  BubbleController({required this.interval, required this.problemController})
      : super() {
    spawnTimer = Timer(interval.toDouble(), repeat: true, onTick: spawnBubble);
  }

  void setLevel(int newLevel) {
    level = newLevel;
  }

  void spawnBubble() {
    //TODO: add the bubble spec into the constructor
    final ballPos = game.getRandomBallPosition();
    // print('the game rect in spawn ${game.camera.visibleWorldRect}');
    // print('spawn a ball at $ballPos');
    final problem = problemController.get(level);
    final box = Bubble(problem: problem, initialPosition: ballPos);
    game.world.add(box);
  }

  @override
  void onMount() {
    super.onMount();
    spawnTimer.start();
  }

  @override
  void onRemove() {
    super.onRemove();
    spawnTimer.stop();
  }

  @override
  void update(double dt) {
    super.update(dt);
    spawnTimer.update(dt);
  }
}
