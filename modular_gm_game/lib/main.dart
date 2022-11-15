import 'dart:io';
// import 'package:corgis_app/screen/desktop/home.dart';
// // import 'package:corgis_app/screen/desktop/map.dart';
// import 'package:corgis_app/screen/desktop/game.dart';
// import 'package:corgis_app/screen/desktop/pause.dart';
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
              // overlayBuilderMap: {
              //   PauseMenu.id: (context, game) => PauseMenu(gameRef: game)
              // },
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   items: const <BottomNavigationBarItem>[
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home),
            //       label: 'Home',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.business),
            //       label: 'Business',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.school),
            //       label: 'School',
            //     ),
            //   ],
            //   //currentIndex: _selectedIndex,
            //   selectedItemColor: Colors.amber[800],
            //   //onTap: _onItemTapped,
            // )
            )
            );
  }
}



