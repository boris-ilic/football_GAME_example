import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:football_game/games/futbal_game.dart';

class FutbalGameWrapper extends StatelessWidget {
  final EdgeInsets safeAreaInsets;
  final void Function(int) onGameOver;

  const FutbalGameWrapper({required this.safeAreaInsets, required this.onGameOver, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: FutbalGame(
        safeAreaInsets: safeAreaInsets,
        onGameOver: onGameOver,
      ),
    );
  }
}
