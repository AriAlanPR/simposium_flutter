import 'dart:async';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:simposium/juego/components/character.dart';
import 'package:simposium/juego/tec_game.dart';

//NOTE - By default the center of the world(in this case the screen) is at position (0,0)
class FirstWorld extends World with HasGameRef<TecGame> {
  late final Character player;
  late final Character enemy;

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    player = Character(
      position: Vector2(0, 0),
      radius: 20,
      color: Colors.red,
    );
    enemy = Character(
      position: Vector2( -30, 30),
      radius: 30,
      color: Colors.blue,
    );

    add(player);
    add(enemy);
  }
  
}