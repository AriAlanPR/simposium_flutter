import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:simposium/juego/components/projectile.dart';
import 'package:simposium/juego/tec_game.dart';

class Character extends SpriteComponent with HasGameRef<TecGame>, CollisionCallbacks {
  Character({
    required super.position,
    required double tamano,
    Color color = Colors.black,
  }) : super(
          anchor: Anchor.center,
          size: Vector2.all(tamano),
        );

  double get minX => -(gameRef.size.x / 2) + size.x / 2;
  double get maxX => (gameRef.size.x / 2) - size.x / 2;
  double get minY => -(gameRef.size.y / 2) + size.y / 2;
  double get maxY => (gameRef.size.y / 2) - size.y / 2;

  @override
  FutureOr<void> onLoad() async {
    print("cargando imagen");
    sprite = await Sprite.load("character.png");
    final scale = ScaleEffect.by(Vector2(4, 4), EffectController(duration: 0.1));
    add(scale);
    print("imagen cargada");
    add(RectangleHitbox());
  }


  void mover({double? deltaX, double? deltaY}) {
    double nuevoX = position.x + (deltaX ?? 0);
    double nuevoY = position.y + (deltaY ?? 0);

    position.x = nuevoX.clamp(minX, maxX);
    position.y = nuevoY.clamp(minY, maxY);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    if(other is Projectile) {
      print("game over");
    } 
    super.onCollisionStart(intersectionPoints, other);
  }
}