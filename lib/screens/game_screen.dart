import 'package:flutter/material.dart';
import 'package:football_game/components/futbal_game_wrapper.dart';
import 'package:football_game/screens/score_screen.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutbalGameWrapper(
          safeAreaInsets: MediaQuery.of(context).padding,
          onGameOver: (int score) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => ScoreScreen(
                score: score,
                onRestart: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const GameScreen(),
                  ));
                },
              ),
            ));
          },
        ),
      ),
    );
  }
}
