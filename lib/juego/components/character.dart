import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:simposium/juego/tec_game.dart';

class Character extends SpriteComponent with HasGameRef<TecGame> {
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
    print("imagen cargada");
  }

  void mover({double? deltaX, double? deltaY}) {
    double nuevoX = position.x + (deltaX ?? 0);
    double nuevoY = position.y + (deltaY ?? 0);

    position.x = nuevoX.clamp(minX, maxX);
    position.y = nuevoY.clamp(minY, maxY);
  }
}