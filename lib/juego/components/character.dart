import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Character extends CircleComponent {
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

  @override
  void update(double dt) {
    super.update(dt);

    double nuevoY = position.y + (dt * 200);
    position.y = nuevoY.clamp(0, 300);

  }
}
