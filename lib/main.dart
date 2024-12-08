import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/bird.dart';

late Vector2 screenSize;
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GameWidget(game: MyGame()),
  );
}

class MyGame extends FlameGame with TapDetector{
  late double canvasWidth;
  late double canvasHeight;
  late Bird _bird;

  @override
  Future<void> onLoad() async {
    // Canvas 크기 가져오기
    screenSize = canvasSize;
    canvasWidth = screenSize.x;
    canvasHeight = screenSize.y;

    // 이미지 로드
    final bgImage = await images.load('bg.png');
    final sprite = Sprite(bgImage);

    // SpriteComponent 추가
    final bgComponent = SpriteComponent(
      sprite: sprite,
      size: Vector2(canvasWidth, canvasHeight),
    );

    add(bgComponent);

    // Bird 인스턴스 생성
    _bird = Bird();
    add(_bird);
  }

  @override
  void onTap(){
    _bird.onTap();
  }
}
