import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';

class Character extends CircleComponent with DragCallbacks {
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

  // @override
  //  void onDragStart(DragStartEvent event) {
  //    // Do something in response to a drag event
  //    position.x = event.canvasPosition.x;
  //    position.y = event.canvasPosition.y;
  //  }
}
