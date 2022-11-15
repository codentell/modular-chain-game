import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import "./game.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();

  if (kIsWeb) {
  } else {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('modular fellow');
      setWindowMinSize(const Size(950, 700));
      setWindowMaxSize(Size.infinite);
    }
  }

  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          body: GameWidget<ModularGame>(
            game: ModularGame(),
          ),
        ));
  }
}
