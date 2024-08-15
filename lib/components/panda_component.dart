import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_game/constants/constants.dart';
import 'package:football_game/games/futbal_game.dart';

class PandaComponent extends SpriteComponent with HasGameRef<FutbalGame>, CollisionCallbacks {
  final double _spriteHeight = 80;
  final double _spriteWidth = 80;
  final double speed = 600; // Speed in pixels per second

  bool _isMovingUp = false;
  bool _gameStarted = false;
  late double _upBound;
  late double _downBound;

  final EdgeInsets safeAreaInsets;

  PandaComponent({required this.safeAreaInsets});

  @override
  Future<void> onLoad() async {
    super.onLoad();

    sprite = await gameRef.loadSprite(Constants.pandaSpriteShort);
    height = _spriteHeight;
    width = _spriteWidth;
    anchor = Anchor.centerLeft;

    // Define the bounds for the panda's movement
    _upBound = safeAreaInsets.top - 40;
    _downBound = gameRef.size.y - 80 - safeAreaInsets.bottom;
    position = Vector2(0, gameRef.size.y / 2);

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!_gameStarted) {
      return;
    }

    if (_isMovingUp) {
      position.y -= speed * dt;
    } else {
      position.y += speed * dt;
    }

    position.y = position.y.clamp(_upBound + 60, _downBound + 30);
  }

  void startMovingUp() {
    _gameStarted = true;
    _isMovingUp = true;
  }

  void stopMovingUp() {
    _isMovingUp = false;
  }
}
