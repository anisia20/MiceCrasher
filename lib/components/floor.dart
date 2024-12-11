import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame/prite.dart';
import 'package:minecrasher/main.dart';

class Floor extends Components{
    Sprite _floorSprite = Sprite('floor.png');

    @override
    void render(Canvas c) {

        _floorSprite.renderPosition(c, Position(0, size.height))
    }

    @override 
    void update(double t) {}
}