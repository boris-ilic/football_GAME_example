import 'package:flame/components.dart';
import 'package:football_game/constants/constants.dart';
import 'package:football_game/games/futbal_game.dart';

class BackgroundComponent extends SpriteComponent with HasGameRef<FutbalGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite(Constants.backgroundSpriteShort);
    size = gameRef.size;
  }
}
