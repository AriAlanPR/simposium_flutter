import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/services/keyboard_key.g.dart';
import 'package:simposium/helpers/app_colors.dart';
import 'package:simposium/helpers/constants.dart';
import 'package:simposium/juego/components/first_world.dart';

class TecGame extends FlameGame<FirstWorld> with HorizontalDragDetector, VerticalDragDetector, KeyboardEvents, HasCollisionDetection {
  final Color bgColor;
  
  TecGame({
    super.children,
    this.bgColor = AppColors.navy,
  }): super(
    world: FirstWorld(),
  );

  TecGame.web({
    this.bgColor = AppColors.navy,
  }) : super(
        camera: CameraComponent.withFixedResolution(
          width: gameWidth,
          height: gameHeight,
          world: FirstWorld(),
        ));

  @override
  Color backgroundColor() {
    return bgColor;
  }

  @override
  void onHorizontalDragUpdate(DragUpdateInfo info) {
    super.onHorizontalDragUpdate(info);
    world.player.mover(deltaX: info.delta.global.x);
  }

  @override
  void onVerticalDragUpdate(DragUpdateInfo info) {
    super.onVerticalDragUpdate(info);
    world.player.mover(deltaY: info.delta.global.y);
  }

  @override
  KeyEventResult onKeyEvent(KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    const distancia = 50.0;

    if(event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      world.player.mover(deltaX: -distancia);
      return KeyEventResult.handled;
    } else if(event.logicalKey == LogicalKeyboardKey.arrowRight) {
      world.player.mover(deltaX: distancia);
      return KeyEventResult.handled;
    } else if(event.logicalKey == LogicalKeyboardKey.arrowDown) {
      world.player.mover(deltaY: distancia);
      return KeyEventResult.handled;
    } else if(event.logicalKey == LogicalKeyboardKey.arrowUp) {
      world.player.mover(deltaY: -distancia);
      return KeyEventResult.handled;
    }

    return KeyEventResult.ignored;
  }
}