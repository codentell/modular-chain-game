import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import './game.dart';

class PauseMenu extends StatelessWidget {
  static const id = "PauseMenu";

  final CorgisGame gameRef;

  const PauseMenu({super.key, required  this.gameRef});

@override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  gameRef.overlays.remove(id);
                  //gameRef.add(GamePlay());
                },
                child: const Text('Play'),
              ),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                onPressed: () {
                  
                  gameRef.overlays.remove(id);
                  //gameRef.overlays.add(Settings.id);
                },
                child: const Text('Settings'),
              ),
            )
          ],
        ),
      ),
    );
  }
}