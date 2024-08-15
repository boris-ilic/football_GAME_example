import 'package:flame/components.dart';
import 'package:football_game/games/futbal_game.dart';

class TimerComponent extends TextComponent {
  FutbalGame game;

  TimerComponent({required this.game}) {
    text = 'Time: 60s';
    anchor = Anchor.topLeft;
    position = Vector2(10, 10);
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (game.gameStarted) {
      text = 'Time: ${game.timeLeft.toInt()}s';
    }
  }
}
