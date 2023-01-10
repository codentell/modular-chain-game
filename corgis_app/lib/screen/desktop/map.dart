
import 'dart:ui';
import 'package:flame/experimental.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:rive/rive.dart';

import 'package:flame/collisions.dart';

// void main() {
//   runApp(GameWidget(
//     game: CorgisGame(),
//   ));
// }

class CorgisGame extends FlameGame with HasCollisionDetection, HasDraggables {
    late final JoystickComponent joystickComponent;
  //Color backgroundColor() => const Color(0xffff0000);

  late final JoystickComponent joystick;

  // CorgisGame() {
  //   //joystick.addObserver(player);
  //   //add(player);
  //   add(joystick);
  // }

  SMIInput<bool>? _test;

  late final  CorgisComponent corgisComponent;

  

  @override
  Future<void> onLoad() async {
    //add(ScreenHitbox());
  
    //await addCollidableBlocks(this);
    var physicalSize = window.physicalSize;
    // print(physicalSize);
    // print(physicalSize.width);
    //camera.viewport = FixedAspectRatioViewport(aspectRatio: 0.5) as Viewport;
    camera.viewport = FixedResolutionViewport(//Vector2(size.y,size.y));
        Vector2(physicalSize.width, physicalSize.height));


        final knobPaint = BasicPalette.blue.withAlpha(200).paint();
    final backgroundPaint = BasicPalette.blue.withAlpha(100).paint();
    joystick = JoystickComponent(
      knob: CircleComponent(radius: 30, paint: knobPaint),
      background: CircleComponent(radius: 100, paint: backgroundPaint),
      margin: const EdgeInsets.only(left: 40, bottom: 40),
    );
    add(joystick);

    //for (double xPosition = 0; xPosition < 800; xPosition += 200) {
    //for (double yPosition = 0; yPosition < 800; yPosition += 200) {
    Artboard corgisArtboard =
        await loadArtboard(RiveFile.asset('assets/logo.riv'));
    final controller =
        StateMachineController.fromArtboard(corgisArtboard, 'logoTrigger');
    _test = controller?.findInput<bool>('isStill');
    //print(_test);
    corgisArtboard.addController(controller!);
    corgisComponent = CorgisComponent(corgisArtboard: corgisArtboard, joystick: joystick);
    corgisComponent.position = Vector2(0, 0);
    add(corgisComponent);

    //camera.followComponent(corgisComponent);



    //camera.followComponent(corgisComponent);

      return await super.onLoad();
  }

  


}

class CorgisComponent extends RiveComponent
    with HasGameRef<CorgisGame>, CollisionCallbacks {
  final Artboard corgisArtboard;
  int startCount = 0;

  final JoystickComponent? joystick;

  CorgisComponent({required this.corgisArtboard, this.joystick})
      : super(
            artboard: corgisArtboard,
            size: Vector2(300, 300),
            anchor: Anchor.center) {
    final hitbox = RectangleHitbox(
      size: size,
      anchor: Anchor.center,
      position: size / 2,
    );
    add(hitbox);
  }

  late RiveAnimation corgisController;
  var speed = 10.0;

  SMIInput<bool>? _test;
  SMIInput<bool>? _test1;

  late ShapeHitbox hitbox;
  late Vector2 velocity;
  final _defaultColor = Colors.cyan;

  //   void _onRiveInit(Artboard artboard) {
  //   final controller = StateMachineController.fromArtboard(artboard, 'bumpy');
  //   artboard.addController(controller!);

  //  // _bump = controller.findInput<bool>('bump') as SMITrigger;
  // }

  void _onStateChange(
    String stateMachineName,
    String stateName,
  ) {
    print('State Changed in $stateMachineName to $stateName');
  }

  @override
  Future<void>? onLoad() async {
//final corgisController = OneShotAnimation('still', autoplay: true);

    //corgisArtboard.addController(SimpleAnimation('idle'));

    final controller = StateMachineController.fromArtboard(
        corgisArtboard, 'logoTrigger',
        onStateChange: _onStateChange);
    _test = controller?.findInput<bool>('isStill') as SMIBool;
    _test1 = controller?.findInput<bool>('isIdle') as SMIBool;

    final defaultPaint = Paint()
      ..color = _defaultColor
      ..style = PaintingStyle.stroke;

    hitbox = CircleHitbox()
      ..paint = defaultPaint
      ..renderShape = true;
    add(hitbox);

    // final center = gameRef.size / 2;
    // velocity = (center - position)..scaleTo(150);

    //  Future.delayed(Duration(seconds: 1), () {
    // _test!.value = true;
    // });

    // Future.delayed(Duration(seconds: 1), () {
    //   _test!.value = false;
    //   _test1!.value = true;
    // });

    corgisArtboard.addController(controller!);
    //Future.delayed(Duration(seconds: 3), () {
    _test!.value = true;

    // final hitboxPaint = BasicPalette.white.paint()
    //   ..style = PaintingStyle.stroke;
    // add(
    //   PolygonHitbox.relative(
    //     [
    //       Vector2(0.0, -1.0),
    //       Vector2(-1.0, -0.1),
    //       Vector2(-0.2, 0.4),
    //       Vector2(0.2, 0.4),
    //       Vector2(1.0, -0.1),
    //     ],
    //     parentSize: size,
    //   )
    //     ..paint = hitboxPaint
    //     ..renderShape = true,
    // );

    //});

    //final corgisController = OneShotAnimation('still', autoplay: true);
    // corgisController =  RiveAnimation.network(

    //               "https://s3.amazonaws.com/cdn.codewithcorgis.com/animations/hexagon.riv",
    //               stateMachines: ["hexagonState"],
    //               alignment: Alignment.center,
    //               fit: BoxFit.contain,
    //             );

    //final corgisController = StateMachineController.fromArtboard(artboard, 'hexagonState');
    //corgisArtboard.addController(corgisController);
    return super.onLoad();
  }

  // @override
  // void onCollisionStart(
  //   Set<Vector2> intersectionPoints,
  //   PositionComponent other,
  // ) {
  //   super.onCollisionStart(intersectionPoints, other);
  //   //hitbox.paint.color = _collisionColor;
  //   print(other);
  //   if (other is ScreenHitbox) {
  //     //removeFromParent();
  //     return;
  //   }
  // }

  bool corgisFlipped = false;

  @override
  void update(double dt) {
    //var physicalSize = window.physicalSize;
    // camera.viewport = FixedResolutionViewport(
    //     Vector2(physicalSize.width, physicalSize.height));
    super.update(dt);


     if (gameRef.joystick == null) return;

     if (gameRef.joystick.direction != JoystickDirection.idle) {
      //position.add(joystick!.relativeDelta * maxSpeed * dt);
        position.add(gameRef.joystick.delta * speed * dt);
    }


    //if(position.x > 200 && position.x < physicalSize.width - 200){
    //position.add(gameRef.joystick.delta * speed * dt);
    if(gameRef.joystick.relativeDelta[0] < 0 && corgisFlipped) {
      corgisFlipped = false;
     gameRef.corgisComponent.flipHorizontallyAroundCenter();
    }
    if(gameRef.joystick.relativeDelta[0] > 0 && !corgisFlipped ) {
      corgisFlipped = true;
           gameRef.corgisComponent.flipHorizontallyAroundCenter();

    }
    //}
    //position.x += 10;
    //velocity * dt;
    //position.add(gameRef.joystick.delta * speed * dt);

    // print(position.x);
    // print(position.y);

    // if(position.x < 300) {

    // }

    // if (position.y >= gameRef.board.size.y - size.y) {
    //   position.setFrom(
    //     Vector2(position.x, (gameRef.board.size.y - _ballRadius * 2) - 2),
    //   );
    //gameRef.gameStore.ballState = BallState.completed;

    // if(position.x  < size[0]) {
    //    position.x += 1;
    //  }

    // if(x < size[0]){
    //   print("hit");
    // }
    //print(position);
    //print(position[0] < size[0]);

    // final controller =
    //     StateMachineController.fromArtboard(corgisArtboard, 'logoTrigger');
    // _test = controller?.findInput<bool>('isStill') as SMIBool;
    // _test1 = controller?.findInput<bool>('isIdle') as SMIBool;
    //_test!.value = true;

    //corgisArtboard.addController(controller!);

    if (x > 100) {
      _test!.value = false;
      _test1!.value = true;
    } else {
      _test!.value = true;
      _test1!.value = false;
    }

    // if (x > 100) {
    //   print(_test!.value);
    //    Future.delayed(Duration(seconds: 1), () {
    //   _test!.value = true;
    //   });

    //   Future.delayed(Duration(seconds: 1), () {
    //     _test!.value = false;
    //     _test1!.value = true;
    //   });

    //   print(_test!.value);
    //    print(_test1!.value);
    // }
    //  final controller = StateMachineController.fromArtboard(corgisArtboard, 'logoTrigger');
    //  _test = controller?.findInput<bool>('isStill');
    // _test1 = controller?.findInput<bool>('isIdle');
    //  print("skill");
    //  print(_test!.value);

    //    _test!.value = true;
    //   //_test!.value = false;
    //   _test1!.value = true;
    //   print("idle");
    //   print(_test1!.value);
    //   if(_test!.value == true ) {
    //     corgisArtboard.addController(SimpleAnimation('idle'));
    //     _test!.value = false;
    //     _test1!.value = true;
    //   } else {
    //      corgisArtboard.addController(SimpleAnimation('still'));
    //         _test1!.value = false;
    //     _test!.value = true;
    //   }

    // if(x > gameRef.size[0] - 300 ){
    //   _test!.value = true;
    //   _test!.value = false;
    //   _test1!.value = true;
    // }

    //print(gameRef.joystick.delta * speed * dt);
    //print(gameRef.joystick);
    //position.add(gameRef.joystick.delta * speed * dt);
    // if (x > gameRef.size[0] - 300) {
    //   gameRef.remove(this);
    // }
    // x += 1;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    // other as TestBlock;
    startCount++;
    print(
        "collision start: other: ${other.center} id:${other} center: ${other.center} me: $center size: $size");
  }


  // @override
  // bool onTapDown(TapDownInfo info) {
  //   if (!corgisController) {
  //     //corgisController.isActive = true;
  //     print('tapped carrot and hopefully, it is moving');
  //   } else {
  //     gameRef.remove(this);
  //   }
  //   return true;
  // }

    Rect? rect;
  Paint paint = BasicPalette.green.paint();

  @override
  render(Canvas canvas) {
    rect ??= Rect.fromCenter(
      center: (size / 2).toOffset(),
      width: 300,
      height: 300,
    );
    canvas.drawRect(rect!, paint);
    super.render(canvas);
  }
}
