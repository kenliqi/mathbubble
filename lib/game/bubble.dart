import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/material.dart';

import '../maths/problem_generator.dart';

class Bubble extends BodyComponent {
  final Problem problem;
  late int answer;

  Bubble({required this.problem, Vector2? initialPosition})
      : super(
          fixtureDefs: [
            FixtureDef(
              CircleShape()..radius = 5.0,
              restitution: 0.1,
              density: 1.0,
              friction: 0,
            ),
          ],
          bodyDef: BodyDef(
            angularDamping: 0.8,
            position: initialPosition ?? Vector2.zero(),
            type: BodyType.dynamic,
          ),
        ) {
    renderBody = true;
    answer = problem.result;

    add(TextComponent(
        text: "${problem.n1} ${operatorStr(problem.op)} ${problem.n2}",
        textRenderer:
            TextPaint(style: const TextStyle(color: Colors.black, fontSize: 2)))
      ..anchor = Anchor.center);
  }
}
