import 'package:flutter/material.dart';

class ScoreScreen extends StatelessWidget {
  final int score;
  final VoidCallback onRestart;
  const ScoreScreen({required this.score, required this.onRestart, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              'GAME OVER',
              style: TextStyle(
                fontSize: 28,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              '$score',
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              'panda points',
              style: TextStyle(
                fontSize: 40,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'High Score: $score',
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey.shade700,
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: onRestart, //restart for testing, change to what you need
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 15, 182, 0),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Claim your points!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
