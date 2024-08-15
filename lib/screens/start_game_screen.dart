import 'package:flutter/material.dart';
import 'package:football_game/constants/constants.dart';
import 'package:football_game/screens/game_screen.dart';

class StartGameScreen extends StatelessWidget {
  const StartGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Text(
              'PANDA-monium',
              style: TextStyle(
                fontSize: 28,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ObstacleInfo(
              image: Image.asset(
                Constants.ballSprite,
                width: 16,
                height: 16,
              ),
              info: '1.000 points',
            ),
            ObstacleInfo(
              image: Image.asset(
                Constants.ballSprite,
                width: 22,
                height: 22,
              ),
              info: '300 points',
            ),
            ObstacleInfo(
              image: Image.asset(
                Constants.cardSprite,
                color: Colors.yellow,
                width: 30,
                height: 30,
              ),
              info: '2 Yellow = Game Over',
            ),
            ObstacleInfo(
              image: Image.asset(
                Constants.cardSprite,
                color: Colors.red,
                width: 30,
                height: 30,
              ),
              info: 'Game Over',
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Tap and get the balls.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              'Red card you lose.',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You have 60s',
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
              ),
            ),
            Text(
              'or',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            const Text(
              'Up to 10.000 panda points',
              style: TextStyle(
                fontSize: 21,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const GameScreen()),
                    ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 90, 186),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'START',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

class ObstacleInfo extends StatelessWidget {
  const ObstacleInfo({required this.image, required this.info, super.key});

  final Image image;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          const SizedBox(width: 6),
          Text(
            info,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}
