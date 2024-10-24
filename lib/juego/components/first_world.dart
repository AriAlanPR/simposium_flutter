import 'dart:async';
import 'dart:math';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:simposium/juego/components/character.dart';
import 'package:simposium/juego/components/projectile.dart';
import 'package:simposium/juego/tec_game.dart';

//NOTE - By default the center of the world(in this case the screen) is at position (0,0)
class FirstWorld extends World with HasGameRef<TecGame> {
  late final Character player;
  double tiempoTranscurrido = 0;

  double get minX => -(gameRef.size.x / 2);
  double get maxX => gameRef.size.x / 2;
  double get minY => -(gameRef.size.y / 2);
  double get maxY => gameRef.size.y / 2;
  Vector2 get randomX {
    final random = Random();
    final x = minX + random.nextInt((maxX).toInt());
    final y = minY + random.nextInt((maxY).toInt());

    return Vector2(x, y);
  }

  @override
  FutureOr<void> onLoad() {
    super.onLoad();

    player = Character(
      position: Vector2(0, 0),
      tamano: 20,
      color: Colors.red,
    );

    add(player);    
  }
  
  @override
  void update(double dt) {
    super.update(dt);
  
    if(tiempoTranscurrido > 200) {
      tiempoTranscurrido = 0;
      add(Projectile(position: randomX, lados: 20));
    } else {
      tiempoTranscurrido ++;
    }
  }
}