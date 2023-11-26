import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame_forge2d/flame_forge2d.dart';

class Boundary extends BodyComponent {
  final Vector2 _start;
  final Vector2 _end;

  Boundary(this._start, this._end);

  @override
  Body createBody() {
    final shape = EdgeShape()..set(_start, _end);
    final fixtureDef = FixtureDef(shape, friction: 0.3);
    final bodyDef = BodyDef(
      position: Vector2.zero(),
    );

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }

  static List<Component> createBoundaries(
      {required Rect visibleRect, double heightScale = 1.0}) {
    // final visibleRect = camera.visibleWorldRect;visibleWorldRect
    final height = visibleRect.height;
    final topLeft = visibleRect.topLeft.toVector2();
    final topRight = visibleRect.topRight.toVector2();
    final bottomRight =
        visibleRect.topRight.toVector2() + Vector2(0, height * heightScale);
    final bottomLeft =
        visibleRect.topLeft.toVector2() + Vector2(0, height * heightScale);

    return [
      // Wall(topLeft, topRight),
      Boundary(topRight, bottomRight),
      Boundary(bottomLeft, bottomRight),
      Boundary(topLeft, bottomLeft),
    ];
  }
}
