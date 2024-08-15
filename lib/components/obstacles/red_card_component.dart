import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:football_game/components/obstacle_component.dart';
import 'package:football_game/constants/constants.dart';

class RedCardComponent extends ObstacleComponent {
  RedCardComponent({required EdgeInsets safeAreaInsets})
      : super(safeAreaInsets: safeAreaInsets, speed: 400, height: 35);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite(Constants.redCardSpriteShort);
    size = Vector2(super.height, super.height);
    anchor = Anchor.center;
  }
}
