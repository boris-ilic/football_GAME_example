import 'dart:math';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:football_game/components/background_component.dart';
import 'package:football_game/components/obstacle_component.dart';
import 'package:football_game/components/obstacles/big_ball_component.dart';
import 'package:football_game/components/obstacles/card_component.dart';
import 'package:football_game/components/obstacles/small_ball_component.dart';
import 'package:football_game/components/panda_component.dart';
import 'package:football_game/components/score_component.dart';
import 'package:football_game/components/tap_to_start_component.dart';
import 'package:football_game/components/timer_component.dart';
import 'package:football_game/constants/constants.dart';
import 'package:football_game/constants/spawn_possibilities.dart';

class FutbalGame extends FlameGame with TapDetector, PanDetector, HasCollisionDetection {
  late PandaComponent panda;
  final EdgeInsets safeAreaInsets;
  final void Function(int) onGameOver;
  int score = 0;
  int maxScore = 10000;
  int yellowCardCount = 0;
  double timeLeft = 60; // Game duration in seconds
  bool gameStarted = false;

  final Random _random = Random();

  FutbalGame({required this.safeAreaInsets, required this.onGameOver});

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(BackgroundComponent());

    panda = PandaComponent(safeAreaInsets: safeAreaInsets);
    add(panda);

    add(ScoreComponent(game: this));
    add(TimerComponent(game: this));

    add(TapToStartComponent());

    FlameAudio.audioCache.loadAll([
      Constants.collisionSound,
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (gameStarted) {
      timeLeft -= dt;
      if (timeLeft <= 0) {
        endGame();
      }
    }
  }

  void startGame() {
    if (!gameStarted) {
      gameStarted = true;
      spawnObstacle();
    }
  }

  void spawnObstacle() {
    if (!gameStarted) return;

    final obstacle = chooseObstacle();
    if (obstacle != null) {
      final yPosition = _random.nextDouble() * (size.y - panda.height) + safeAreaInsets.top;
      obstacle.position = Vector2(size.x, yPosition);
      add(obstacle);
    }

    Future.delayed(const Duration(milliseconds: 500), spawnObstacle);
  }

  ObstacleComponent? chooseObstacle() {
    const totalWeight = SpawnPossibilities.smallBallWeight +
        SpawnPossibilities.bigBallWeight +
        SpawnPossibilities.redCardWeight +
        SpawnPossibilities.yellowCardWeight;
    final roll = _random.nextInt(totalWeight);

    if (roll < SpawnPossibilities.smallBallWeight) {
      return SmallBallComponent(safeAreaInsets: safeAreaInsets);
    } else if (roll < SpawnPossibilities.smallBallWeight + SpawnPossibilities.bigBallWeight) {
      return BigBallComponent(safeAreaInsets: safeAreaInsets);
    } else if (roll <
        SpawnPossibilities.smallBallWeight + SpawnPossibilities.bigBallWeight + SpawnPossibilities.redCardWeight) {
      return CardComponent(safeAreaInsets: safeAreaInsets, color: Colors.red);
    } else {
      return CardComponent(safeAreaInsets: safeAreaInsets, color: Colors.yellow);
    }
  }

  void handleCollision(ObstacleComponent obstacle) {
    if (obstacle is SmallBallComponent) {
      score += 1000;
      obstacle.removeFromParent(); // Remove the ball after scoring
    } else if (obstacle is BigBallComponent) {
      score += 300;
      obstacle.removeFromParent(); // Remove the ball after scoring
    } else if (obstacle is CardComponent) {
      if ((obstacle).color == Colors.red) {
        endGame();
      } else if ((obstacle).color == Colors.yellow) {
        if (yellowCardCount > 0) {
          endGame();
        } else {
          yellowCardCount++;
          obstacle.removeFromParent(); // Remove the yellow card after collection
        }
      }
    }

    if (score >= maxScore) {
      endGame();
    }
  }

  void endGame() {
    pauseEngine();
    gameStarted = false;
    onGameOver(score); // Call the callback with the score
  }

  @override
  void onTapDown(TapDownInfo info) {
    startGame();
    panda.startMovingUp();
  }

  @override
  void onTapUp(TapUpInfo info) {
    panda.stopMovingUp();
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    panda.startMovingUp();
  }

  @override
  void onPanEnd(DragEndInfo info) {
    panda.stopMovingUp();
  }
}
