// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// import 'src/navigation_controls.dart';
// import 'src/web_view_stack.dart';

// void main() {
//   runApp(
//     const MaterialApp(
//       home: WebViewApp(),
//     ),
//   );
// }

// class WebViewApp extends StatefulWidget {
//   const WebViewApp({super.key});

//   @override
//   State<WebViewApp> createState() => _WebViewAppState();
// }

// class _WebViewAppState extends State<WebViewApp> {
//   final controller = Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter WebView'),
//         actions: [
//           NavigationControls(controller: controller),
//           //Menu(controller: controller),                // Add this line
//         ],
//       ),
//       body: WebViewStack(controller: controller),
//     );
//   }
// }

import 'dart:io';
import 'package:corgis_app/screen/desktop/home.dart';
// import 'package:corgis_app/screen/desktop/map.dart';
import 'package:corgis_app/screen/desktop/game.dart';
import 'package:corgis_app/screen/desktop/pause.dart';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();

  if (kIsWeb) {
  } else {
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      setWindowTitle('corgis.xyz');
      setWindowMinSize(const Size(580, 700));
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
            appBar: AppBar(
              backgroundColor: Color(0XFF5F5DEF) ,
            ),
            body: GameWidget<CorgisGame>(
              game: CorgisGame(),
              overlayBuilderMap: {
                PauseMenu.id: (context, game) => PauseMenu(gameRef: game)
              },
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
