import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:football_game/components/panda_component.dart';
import 'package:football_game/constants/constants.dart';
import 'package:football_game/games/futbal_game.dart';

abstract class ObstacleComponent extends SpriteComponent with HasGameRef<FutbalGame>, CollisionCallbacks {
  final EdgeInsets safeAreaInsets;
  final double speed;

  @override
  final double height;

  late double _upBound;
  late double _downBound;

  ObstacleComponent({required this.safeAreaInsets, required this.speed, required this.height});

  @override
  Future<void> onLoad() async {
    super.onLoad();

    _upBound = safeAreaInsets.top - 40;
    _downBound = gameRef.size.y - 80 - safeAreaInsets.bottom;
    position.y = position.y.clamp(_upBound + 60, _downBound + 30);
    add(CircleHitbox());
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is PandaComponent) {
      FlameAudio.play(Constants.collisionSound);
      removeFromParent();
      gameRef.handleCollision(this);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= speed * dt;
  }
}
