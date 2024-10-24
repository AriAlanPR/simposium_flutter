import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:simposium/juego/tec_game.dart';

class Projectile extends RectangleComponent with HasGameRef<TecGame>, CollisionCallbacks {
  Projectile({
    required super.position,
    required double lados,
    Color color = Colors.white,
  }) : super(
          anchor: Anchor.center,
          size: Vector2(lados, lados),
          paint: Paint()
            ..color = color
            ..style = PaintingStyle.fill,
        );

  double get minX => -(gameRef.size.x / 2) + size.x / 2;
  double get maxX => (gameRef.size.x / 2) - size.x / 2;
  double get minY => -(gameRef.size.y / 2) + size.y / 2;
  double get maxY => (gameRef.size.y / 2) - size.y / 2;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    final traslacion = MoveToEffect(
      Vector2(position.x, maxY),
      EffectController(duration: 3)
    );

    final rotacion = RotateEffect.by(
      10,
      EffectController(duration: 2),
    );

    add(traslacion);
    add(rotacion);
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if(other is ScreenHitbox) {
      gameRef.remove(this);
    }
  }
}
