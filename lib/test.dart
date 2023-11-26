import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/particles.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Flame.images.loadAll(<String>[
  //   'particle.png', // Image for particles
  // ]);
  final game = MyGame();
  runApp(GameWidget(game: game));
}

class MyGame extends FlameGame {
  MyGame() {
    Random rnd = Random();

    Vector2 randomVector2() =>
        (Vector2.random(rnd) - Vector2.random(rnd)) * 200;

// Composition.
//
// Defining a particle effect as a set of nested behaviors from top to bottom,
// one within another:
//
// ParticleSystemComponent
//   > ComposedParticle
//     > AcceleratedParticle
//       > CircleParticle
    add(
      ParticleSystemComponent(
        particle: Particle.generate(
          count: 10,
          generator: (i) => AcceleratedParticle(
            acceleration: randomVector2(),
            child: CircleParticle(
              paint: Paint()..color = Colors.red,
            ),
          ),
        ),
      ),
    );

    add(ParticleSystemComponent(
        particle: Particle.generate(
            count: 10,
            generator: (i) =>
                CircleParticle(paint: Paint()..color = Colors.red))));
  }

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
