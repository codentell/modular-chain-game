import 'dart:math';
import 'dart:ui';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';
import 'package:flame/parallax.dart';
import 'package:flame/sprite.dart';

import 'package:flame_rive/flame_rive.dart';

import 'package:rive/rive.dart';

import "./player.dart";


class ModularGame extends FlameGame
    with
        HasDraggables,
        HasTappables,
        HasCollisionDetection,
        HasHoverables,
        ScrollDetector,
        HasKeyboardHandlerComponents {
  late Player _player;

  @override
  Future<void> onLoad() async {
    //camera.viewport = FixedResolutionViewport(viewportResolution);
    add(Map());
    final joystick = JoystickComponent(
      anchor: Anchor.bottomLeft,
      position: Vector2(30, size.y - 30),
      // size: 100,
      background: CircleComponent(
        radius: 60,
        paint: Paint()..color = Colors.white.withOpacity(0.5),
      ),
      knob: CircleComponent(radius: 30),
    );

     Artboard celestiaArtboard =
         await loadArtboard(RiveFile.asset('assets/celestia.riv'));



    Artboard metamaskArtboard =
        await loadArtboard(RiveFile.asset('assets/metamask.riv'));

    // Artboard hexagonArtboard =
    //     await loadArtboard(RiveFile.asset('assets/hexagon.riv'));

    //     final hexagonController =
    //     StateMachineController.fromArtboard(hexagonArtboard, 'hexagonState');
    // _hextest = hexagonController?.findInput<bool>('isPressed');

    // hexagonArtboard.addController(hexagonController!);

     
    // final controller = 
    //     StateMachineController.fromArtboard(celestiaArtboard, 'logoTrigger');
    // _test = controller?.findInput<bool>('isStill');
    // _test1 = controller?.findInput<bool>('isIdle');
    // print(_test);
    // final controller = OneShotAnimation('idle', autoplay: true);
    // celestiaArtboard.addController(controller);

    // _test!.value = true;
    // _hextest!.value = true;

    //  Future.delayed(Duration(seconds: 1), () {
    //    print("Hi");
    //        _test!.value = false;
    //       _test1!.value = true;
    //  });

    // print(_test!.value);
    // print(_test1!.value);

     _player = Player(
       joystick: joystick,
       celestiaArtboard: celestiaArtboard,
       size: Vector2(100, 100),
       position: Vector2(0, 0),
     );

    //_player.anchor = Anchor.center;
    //add(BackgroundComponent());
    add(_player);
    add(joystick);

    //camera.speed = 10;
    //camera.followComponent(_player);

    //camera.followComponent(_player);
    //camera.speed = 10;
    camera.speed = 10;
    camera.followComponent(_player, worldBounds: Map.bounds);

     for (var i = 0; i < 30; i++) {
        add(Rock(Vector2(Map.genCoord(), Map.genCoord()), metamaskArtboard));
     }

    // add(Rock(Vector2(-120.0, 40.0), metamaskArtboard));

    // add(Rock(Vector2(0, -140.0), metamaskArtboard));

    // add(Hexagon(hexagonArtboard: hexagonArtboard, position: Vector2(0, 0)));
    //add(Rock(Vector2(Map.genCoord(), Map.genCoord()), metamaskArtboard));
    //}
    return await super.onLoad();
  }

   @override
  void onScroll(PointerScrollInfo info) {
    print(info);
    //target =  + info.scrollDelta.game * 5;
  }

  //   @override
  // void onScroll(PointerScrollInfo info) {
  //   camera.zoom += info.scrollDelta.game.y.sign * 0.08;
  //   camera.zoom = camera.zoom.clamp(0.05, 5.0);
  // }
}

class Map extends Component {
  static const double size = 1000;
  //static const double size = 1000;
  static const Rect bounds = Rect.fromLTWH(-1000, -500, 2*size, 2 * size);
  //static const Rect bounds = Rect.fromLTWH(-250, -250, 2000, 2000);
  //static const Rect bounds = Rect.fromLTWH(-250, -250, 500, 2 * size);

  static final Paint _paintBorder = Paint()
    ..color = Colors.white12
    ..strokeWidth = 10
    ..style = PaintingStyle.stroke;
  static final Paint _paintBg = Paint()..color = const Color(0xFF333333);

  static final _rng = Random();

  late final List<Paint> _paintPool;
  late final List<Rect> _rectPool;

  Map() : super(priority: 0) {
    _paintPool = List<Paint>.generate(
      (size / 50).ceil(),
      (_) => PaintExtension.random(rng: _rng)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
      growable: false,
    );
    _rectPool = List<Rect>.generate(
      (size / 50).ceil(),
      (i) => Rect.fromCircle(center: Offset.zero, radius: size - i * 50),
      growable: false,
    );
  }

  @override
  void render(Canvas canvas) {
    print(bounds);
    canvas.drawRect(bounds, _paintBg);
    //canvas.drawRect(bounds, _paintBorder);
    for (var i = 0; i < (size / 50).ceil(); i++) {
      //canvas.drawCircle(Offset.zero, size - i * 50, _paintPool[i]);
      canvas.drawRect(_rectPool[i], _paintBorder);
    }
  }

  static double genCoord() {
    return -size + _rng.nextDouble() * (2 * size);
  }
}

class Hexagon extends RiveComponent
    with CollisionCallbacks, HasGameRef, GameCollidable, Tappable, Hoverable {
  SMIInput<bool>? _hextest;

  final Artboard hexagonArtboard;

  Hexagon({
    required this.hexagonArtboard,
    Vector2? position,
  }) : super(
          artboard: hexagonArtboard,
          position: position,
          size: Vector2.all(200),
          priority: 1,
        ) {
    initCenter();
    initCollision();
  }

  @override
  Future<void> onLoad() async {
    // Artboard artboard =
    //     await loadArtboard(RiveFile.asset('assets/hexagon.riv'));


    final hexagonController =
        StateMachineController.fromArtboard(hexagonArtboard, 'hexagonState');
    _hextest = hexagonController?.findInput<bool>('isPressed');

    hexagonArtboard.addController(hexagonController!);



    //print(_hextest!.value);
    _hextest!.value = false;

    // _test = controller?.findInput<bool>('isStill');
    // _test1 = controller?.findInput<bool>('isIdle');
    // print(_test);

    //OneShotAnimation('idle', autoplay: true);
  }

bool isHovered = false;
bool onHoverEnter(PointerHoverInfo event) {
    print("hover enter");
     _hextest!.value = true;
    
    return true;
  }
  bool onHoverLeave(PointerHoverInfo event) {
   print("hover leave");
      _hextest!.value = false;
   return true;
  }

  @override
  bool onTapUp(_) {
//        _hextest!.value = true;
//        Future.delayed(const Duration(seconds: 1), () {
//         gameRef.overlays.add(PauseMenu.id);
// });

    return true;
  }

  @override
  bool onTapDown(_) {
    print("Hi");
  _hextest!.value = false;


   
     //  _hextest!.value = false;
    //print(_hextest!.value);
    // add(
    //   ScaleEffect.by(
    //     Vector2.all(10),
    //     EffectController(duration: 0.3),
    //   ),
    // );
    return true;
  }

  // @override
  // bool onTapCancel(_) {
  //   print("Hi");
  //      _hextest!.value = false;

   
  //    //  _hextest!.value = false;
  //   //print(_hextest!.value);
  //   // add(
  //   //   ScaleEffect.by(
  //   //     Vector2.all(10),
  //   //     EffectController(duration: 0.3),
  //   //   ),
  //   // );
  //   return true;
  // }
}

class Rock extends RiveComponent
    with CollisionCallbacks, HasGameRef, GameCollidable, Tappable {
  //final Artboard artboard;
  Rock(
    Vector2 position,
    Artboard artboard,
  ) : super(
          artboard: artboard,
          position: position,
          size: Vector2.all(100),
          priority: 1,
        ) {
    initCenter();
    initCollision();
  }

  late ShapeHitbox hitbox;

  @override
  Future<void> onLoad() async {
    // Artboard corgisArtboard =
    //     await loadArtboard(RiveFile.asset('assets/logo.riv'));

    final metamaskController = OneShotAnimation('idle', autoplay: true);
    // final controller =
    //     StateMachineController.fromArtboard(artboard, 'logoTrigger');

    artboard.addController(metamaskController);

    final defaultPaint = Paint()
      ..color = Colors.cyan
      ..style = PaintingStyle.stroke;

    //sprite = await gameRef.loadSprite('nine-box.png');
    //paint = Paint()..color = Colors.white;
    hitbox = RectangleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);
    //add();
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    removeFromParent();
  }

  @override
  bool onTapDown(_) {
    add(
      ScaleEffect.by(
        Vector2.all(10),
        EffectController(duration: 0.3),
      ),
    );
    return true;
  }
}

mixin GameCollidable on PositionComponent {
  void initCollision() {
    add(RectangleHitbox()..collisionType = CollisionType.passive);
  }

  void initCenter() {
    cachedCenter = Vector2(position.x + 100 / 2, position.y + 100 / 2);
  }

  late final Vector2 cachedCenter;
}
