import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:simposium/helpers/app_colors.dart';
import 'package:simposium/helpers/constants.dart';
import 'package:simposium/juego/components/first_world.dart';

class TecGame extends FlameGame {
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
}