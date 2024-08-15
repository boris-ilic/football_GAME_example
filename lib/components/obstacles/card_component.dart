import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:football_game/components/obstacle_component.dart';
import 'package:football_game/constants/constants.dart';

class CardComponent extends ObstacleComponent {
  CardComponent({
    required EdgeInsets safeAreaInsets,
    required this.color,
  }) : super(
          safeAreaInsets: safeAreaInsets,
          speed: 400,
          height: 35,
        );

  final Color color;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite(Constants.cardSpriteShort);
    size = Vector2(super.height, super.height);
    anchor = Anchor.center;

    add(
      ColorEffect(
        color,
        EffectController(duration: 0.0, infinite: false),
      ),
    );
  }
}
