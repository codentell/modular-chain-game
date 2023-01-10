import 'dart:ui';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import 'package:flame/collisions.dart';

import "./game.dart";

class Player extends RiveComponent
    with
        HasGameRef<CorgisGame>,
        CollisionCallbacks,
        GameCollidable,
        KeyboardHandler 
         {
  late JoystickComponent joystick;
  final Artboard corgisArtboard;
  Player({
    required this.corgisArtboard,
    required this.joystick,
    Vector2? position,
    Vector2? size,
  }) : super(
            position: position,
            artboard: corgisArtboard,
            size: size,
            anchor: Anchor.center) {
    // initCenter();
    // initCollision();
    //            final hitbox = RectangleHitbox(
    //   size: size,
    //   anchor: Anchor.center,
    //   position: size,
    // );
    // add(hitbox);
  }

  SMIInput<bool>? _test;
  SMIInput<bool>? _test1;
  SMIInput<bool>? _test2;
  static const double speed = 300;
  final Vector2 velocity = Vector2.zero();
  static final TextPaint textRenderer = TextPaint(
    style: const TextStyle(color: Colors.white70, fontSize: 12),
  );
  late final TextComponent positionText;

  late ShapeHitbox hitbox;
  final _defaultColor = Colors.cyan;

  @override
  Future<void>? onLoad() async {
    // final controller1 =
    //     StateMachineController.fromArtboard(corgisArtboard, 'logoTrigger');
    // _test = controller1?.findInput<bool>('isStill') as SMIBool;
    // _test1 = controller1?.findInput<bool>('isIdle') as SMIBool;


    final controller1 =
        StateMachineController.fromArtboard(corgisArtboard, 'playerState');
    _test = controller1?.findInput<bool>('isIdle') as SMIBool;
    _test1 = controller1?.findInput<bool>('isBack') as SMIBool;
    _test2 = controller1?.findInput<bool>('isRight') as SMIBool;

    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke;

    hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
    corgisArtboard.addController(controller1!);

    _test!.value = true;

    // print(_test!.value);

    positionText = TextComponent(
      textRenderer: textRenderer,
      position: (size / 2)..y = size.y / 2 + 30,
      anchor: Anchor.center,
    );
    add(positionText);
    add(CircleHitbox());

    return super.onLoad();
  }

  final List<String> keysPressed = [];
   final Vector2 _direction = Vector2.zero();


   @override
  bool onKeyEvent(RawKeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    //print(event.character);
    //this.keysPressed.add(event.character ?? 'none');
    print(keysPressed);
     final isKeyDown = event is RawKeyDownEvent;

     if (!event.repeat) { 
        if (event.logicalKey == LogicalKeyboardKey.keyA) {
            _test!.value = false;
      _test1!.value = false;
     // _test2!.value = true;
        _direction.x += isKeyDown ? -1 : 1;
      } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
                   _test!.value = false;
      _test1!.value = false;
      _test2!.value = true;
        _direction.x += isKeyDown ? 1 : -1;
      } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
        _test2!.value = false;
       
        _test1!.value = false;
         _test!.value = true;
        _direction.y += isKeyDown ? -1 : 1;
      } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
        _direction.y += isKeyDown ? 1 : -1;
      }
    }
  


    return false;
  }

  //   @override
  // KeyEventResult onKeyEvent(
  //   RawKeyEvent event,
  //   Set<LogicalKeyboardKey> keysPressed,
  // ) {
  //   final isKeyDown = event is RawKeyDownEvent;



  //   // Avoiding repeat event as we are interested only in
  //   // key up and key down event.
  //   if (!event.repeat) {
       
  //     if (event.logicalKey == LogicalKeyboardKey.keyA) {
  //       _direction.x += isKeyDown ? -1 : 1;
  //     } else if (event.logicalKey == LogicalKeyboardKey.keyD) {
  //       _direction.x += isKeyDown ? 1 : -1;
  //     } else if (event.logicalKey == LogicalKeyboardKey.keyW) {
  //       //       _test2!.value = false;
  //       // _test!.value = false;
  //       // _test1!.value = true;
  //       _direction.y += isKeyDown ? -1 : 1;
  //     } else if (event.logicalKey == LogicalKeyboardKey.keyS) {
  //       _direction.y += isKeyDown ? 1 : -1;
  //     }
  //   }

  //   return super.onKeyEvent(event, keysPressed);
  // }

  

  @override
  void update(double dt) {
    super.update(dt);
    //final deltaPosition = velocity * (speed * dt);

    //position.add(deltaPosition);
    //   Future.delayed(Duration(seconds: 1), () {});
    positionText.text = '(${x.toInt()}, ${y.toInt()})';

    final displacement = _direction.normalized() * 100 * dt;
    position.add(displacement);

    //Future.delayed(Duration(seconds: 3), () {
    //     _test!.value = false;
    // _test1!.value = true;
    //});

    // if (x > 100) {
    //   _test!.value = false;
    //   _test1!.value = true;
    // } else {
    //   _test1!.value = false;
    //   _test!.value = true;
    // }

    //   print(_test!.value);
    //   print(_test1!.value);
    if (joystick == null) return;

    if (joystick.direction != JoystickDirection.idle) {
      //position.add(joystick!.relativeDelta * maxSpeed * dt);
      position.add(joystick!.relativeDelta * 200 * dt);
    }

    if( joystick.direction ==JoystickDirection.up ) {
      print("up!");
      _test2!.value = false;
      _test!.value = false;
      _test1!.value = true;
    } 

    else if(joystick.direction == JoystickDirection.down) {
       _test2!.value = false;
       _test1!.value = false;
       _test!.value = true;
    }

    else if(joystick.direction == JoystickDirection.left || joystick.direction == JoystickDirection.downLeft ) {
      _test2!.value = false;
      _test1!.value = false;
      _test!.value = true;
      //_test2!.value = true;
    }

    else if(joystick.direction == JoystickDirection.right || joystick.direction == JoystickDirection.downRight ) {
      _test!.value = false;
      _test1!.value = false;
      _test2!.value = true;
    }

    //  if (!joystick.delta.isZero()) {
    //   position.add(joystick.relativeDelta * 100 * dt);
    // }

    //     _test!.value = false;
    //  _test1!.value = true;

    position.clamp(Vector2(-250, -250), Vector2(250, 500)
        //   //Vector2.zero() + size,
        //   gameRef.size - size / 2,
        );
  }

  // //final hitbox = RectangleHitbox();
  // bool canMoveLeft = true;
  // bool canMoveRight = true;
  // bool canMoveTop = true;
  // bool canMoveBottom = true;

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    //print("intersection");
    final myCenter =
        Vector2(position.x + 75 / 2, position.y + 75 / 2);

    //print(myCenter);
    

    if (other is GameCollidable) {
      // _test!.value = false;
      // _test1!.value = true;
      //print(other.cachedCenter);
      // final diffX = myCenter.x - other.cachedCenter.x;
      
      //  if (diffX < 0) {
      //    canMoveRight = false;
      //  } else if (diffX > 0) {
      //    canMoveLeft = false;
      //  }

      //  final diffY = myCenter.y - other.cachedCenter.y;
      //  if (diffY < 0) {
      //    canMoveBottom = false;
      //  } else if (diffY > 0) {
      //    canMoveTop = false;
      //  }
      //  final newPos = Vector2(position.x + diffX / 3, position.y + diffY / 3);
      //  position = newPos;
    }
    
    // if (other is Rock) {
    //   _test!.value = false;
    //   _test1!.value = true;
    //   print(_test!.value);
    //   //removeFromParent();
    // }
    // print(intersectionPoints);
    // print("Other");
    // print(other);
    // velocity.negate();
    // flipHorizontally();
  }
}

// mixin GameCollidable on PositionComponent {
//   void initCollision() {
//     add(RectangleHitbox()..collisionType = CollisionType.passive);
//   }

//   void initCenter() {
//     cachedCenter = Vector2(position.x + 75 / 2, position.y + 75 / 2);
//   }

//   late final Vector2 cachedCenter;
// }
