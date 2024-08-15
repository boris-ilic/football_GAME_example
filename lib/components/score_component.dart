import 'package:flame/components.dart';
import 'package:football_game/games/futbal_game.dart';

class ScoreComponent extends TextComponent {
  FutbalGame game;

  ScoreComponent({required this.game}) {
    text = 'Score: 0';
    anchor = Anchor.topRight;
    position = Vector2(game.size.x - 10, 10);
  }

  @override
  void update(double dt) {
    super.update(dt);
    text = 'Score: ${game.score}';
  }
}
