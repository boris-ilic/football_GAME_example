import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:football_game/games/futbal_game.dart';

class TapToStartComponent extends TextComponent with HasGameRef<FutbalGame>, TapCallbacks {
  TapToStartComponent() {
    text = 'Tap to Start';
    anchor = Anchor.center;
    _initAnimation();
  }

  late double _baseFontSize;
  late Timer _flashTimer;
  late TextPaint _textPaint;
  bool isBold = false;

  void _initAnimation() {
    _baseFontSize = 48; // Base font size for the text
    _textPaint = TextPaint(
      style: TextStyle(
        fontSize: _baseFontSize,
        color: Colors.white,
        fontWeight: FontWeight.normal,
      ),
    );
    textRenderer = _textPaint;

    _flashTimer = Timer(
      0.5,
      onTick: () {
        _flashText();
      },
      repeat: true,
    )..start();
  }

  void _flashText() {
    // Toggle between normal and bold white for smoother flashing effect
    final newFontWeight = isBold ? FontWeight.w500 : FontWeight.w600;
    isBold = !isBold;

    _textPaint = TextPaint(
      style: TextStyle(
        fontSize: _baseFontSize,
        color: Colors.white,
        fontWeight: newFontWeight,
      ),
    );
    textRenderer = _textPaint;
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    _flashTimer.start();
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    position = Vector2(size.x / 2, (size.y / 2) - 150); // Center the text and move it 200 pixels higher
  }

  @override
  void update(double dt) {
    super.update(dt);
    _flashTimer.update(dt);
    if (gameRef.gameStarted) {
      removeFromParent();
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    if (!gameRef.gameStarted) {
      gameRef.startGame();
    }
  }
}
