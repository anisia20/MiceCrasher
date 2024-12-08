import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:flame/flame.dart';
import 'package:mice_crasher/main.dart';

final double BIRD_W = 52;
final double BIRD_H = 36.7;
final double GRAVITY = 900;

class Bird extends SpriteAnimationComponent {
  Bird()
      : super(
    size: Vector2(BIRD_W, BIRD_H)
  );
  double speedY = 0.0;

  @override
  Future<void> onLoad() async {
    // 이미지 로드
    final spriteSheet = await Flame.images.load('bird.png');

    // 애니메이션 설정
    animation = SpriteAnimation.fromFrameData(
      spriteSheet,
      SpriteAnimationData.sequenced(
        amount: 3, // 이미지 시트의 프레임 개수
        stepTime: 0.1, // 각 프레임의 지속 시간
        textureSize: Vector2(17, 12) // 각 프레임의 크기
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
    anchor = Anchor.center;
    // 화면 중앙 계산
    speedY += GRAVITY * dt;
    // 새의 Y 위치 업데이트
    y += (speedY * dt) / 2;
    x = screenSize.x / 2;
    //
    // // 화면 밖으로 나가지 않도록 위치 제한
    // if (position.y > screenSize.y) { // 예: 바닥 높이 400
    //   position.y = 400;
    //   speedY = 0;
    // }
    // print(speedY);
  }
  void onTap(){
    this.speedY = -500;
  }
}
