import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';
import 'package:process_run/shell.dart';
import 'package:flame/collisions.dart';

import "./game.dart";

class Player extends RiveComponent
    with
        HasGameRef<ModularGame>,
        CollisionCallbacks,
        GameCollidable,
        KeyboardHandler {
  late JoystickComponent joystick;
  final Artboard celestiaArtboard;
  Player({
    required this.celestiaArtboard,
    required this.joystick,
    Vector2? position,
    Vector2? size,
  }) : super(
            position: position,
            artboard: celestiaArtboard,
            size: Vector2(100, 100),
            anchor: Anchor.center) {}

  static const double speed = 300;
  late int count = 0;
  final Vector2 velocity = Vector2.zero();
  static final TextPaint textRenderer = TextPaint(
    style: const TextStyle(color: Colors.white70, fontSize: 12),
  );
  late final TextComponent positionText;
  late final TextComponent scoreText;

  late ShapeHitbox hitbox;
  final _defaultColor = Colors.cyan;

  @override
  Future<void>? onLoad() async {

    final controller = OneShotAnimation('idle', autoplay: true);

    celestiaArtboard.addController(controller);

    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke;

    hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);


    scoreText = TextComponent(
      textRenderer: textRenderer,
      position: (size / 2)..y = size.y / 2 - 50,
      anchor: Anchor.bottomCenter,
    );

    positionText = TextComponent(
      textRenderer: textRenderer,
      position: (size / 2)..y = size.y / 2 + 30,
      anchor: Anchor.center,
    );
    add(scoreText);
    add(positionText);
  }

  @override
  void update(double dt) {
    super.update(dt);
    positionText.text = '(${x.toInt()}, ${y.toInt()})';
    scoreText.text = 'Score: ${count}';

    if (joystick == null) return;

    if (joystick.direction != JoystickDirection.idle) {
      position.add(joystick.relativeDelta * 200 * dt);
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is GameCollidable) {
      print(other);
      if (other is Rock) {
        count += 1;
        scoreText.text = 'Score: ${count}';
        var shell = Shell();

        

        shell.run('''

# Send scores to onchain event for ignite to track
# modulargamed tx modulargame create-fellow ${count} ${x.toInt()} ${y.toInt()}  --from alice --yes 
./modulargamed tx modulargame create-fellow ${count} ${x.toInt()} ${y.toInt()}  --from alice --yes 

''');
      }
      //velocity.negate();

    }
  }
}
