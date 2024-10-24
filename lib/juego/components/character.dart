import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:simposium/juego/tec_game.dart';

class Character extends CircleComponent with HasGameRef<TecGame> {
  Character({
    required super.position,
    required double radius,
    Color color = Colors.black,
  }) : super(
          anchor: Anchor.center,
          radius: radius,
          paint: Paint()
            ..color = color
            ..style = PaintingStyle.fill,
        );

  double get minX => -(gameRef.size.x / 2) + radius / 2;
  double get maxX => (gameRef.size.x / 2) - radius / 2;
  double get minY => -(gameRef.size.y / 2) + radius / 2;
  double get maxY => (gameRef.size.y / 2) - radius / 2;

  @override
  void update(double dt) {
    super.update(dt);

    // double nuevoY = position.y + (dt * 200);
    // position.y = nuevoY.clamp(0, 300);
  }

  void mover({double? deltaX, double? deltaY}) {
    double nuevoX = position.x + (deltaX ?? 0);
    double nuevoY = position.y + (deltaY ?? 0);

    position.x = nuevoX.clamp(minX, maxX);
    position.y = nuevoY.clamp(minY, maxY);        
  }
}
