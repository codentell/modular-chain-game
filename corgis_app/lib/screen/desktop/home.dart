import 'dart:io';
import 'package:flutter/material.dart';
import 'package:window_size/window_size.dart';
import 'package:rive/rive.dart';

class BorderFrame extends CustomPainter {
  late Color topColor;
  late Color topColorBorder;
  late Color rightColor;
  late Color rightColorBorder;
  late Color bottomColor;
  late Color bottomColorBorder;
  late Color leftColor;
  late Color leftColorBorder;
  late List<double> border = [];

  BorderFrame(
      {Key? key,
      required this.topColor,
      required this.topColorBorder,
      required this.rightColor,
      required this.rightColorBorder,
      required this.bottomColor,
      required this.bottomColorBorder,
      required this.leftColor,
      required this.leftColorBorder,
      required this.border});

  @override
  void paint(Canvas canvas, Size size) {
    final topPaint = Paint();
    final rightPaint = Paint();
    final bottomPaint = Paint();
    final leftPaint = Paint();

    //topPaint.color = topColor; // Color(0xFFB0BEEA);

    // var topBorder = Path();
    // topBorder
    //   ..moveTo(0, border[0])
    //   ..lineTo(border[0], 0)
    //   ..lineTo(size.width, 0)
    //   ..lineTo(size.width, border[0])
    //   ..close();

    //canvas.drawPath(topBorder, topPaint);

    rightPaint.color = rightColor; // Color(0xFFFFD233);

    var rightBorder = Path();
    rightBorder
      ..moveTo(size.width, 0)
      ..lineTo(size.width - border[1], 0)
      ..lineTo(size.width - border[1], size.height)
      ..lineTo(size.width, size.height - border[1])
      ..close();

    canvas.drawPath(rightBorder, rightPaint);

    rightPaint.color = rightColorBorder; //Color(0xFFFFB252);

    rightBorder = Path();
    rightBorder
      ..moveTo(size.width - border[1], 0)
      ..lineTo(size.width - border[1] - 5, 0)
      ..lineTo(size.width - border[1] - 5, size.height - border[1])
      ..lineTo(size.width - border[1], size.height - border[1])
      ..close();

    canvas.drawPath(rightBorder, rightPaint);

    bottomPaint.color = bottomColor; // Color(0xFF2B5B84);

    var bottomBorder = Path();
    bottomBorder
      ..moveTo(size.width, size.height - border[2])
      ..lineTo(0, size.height - border[2])
      ..lineTo(0, size.height)
      ..lineTo(size.width - border[2], size.height)
      ..close();

    canvas.drawPath(bottomBorder, bottomPaint);

    bottomPaint.color = bottomColorBorder; //Color(0xFF3D85C3);

    bottomBorder = Path();
    bottomBorder
      ..moveTo(size.width - border[2], size.height - border[2])
      ..lineTo(0, size.height - border[2])
      ..lineTo(0, size.height - border[2] - 5)
      ..lineTo(size.width - border[2], size.height - border[2] - 5)
      ..close();

    canvas.drawPath(bottomBorder, bottomPaint);

    leftPaint.color = leftColor; //Color(0xFF26A3FE);

    var leftBorder = Path();
    leftBorder
      ..moveTo(border[3], size.height - border[3])
      ..lineTo(border[3], border[3])
      ..lineTo(0, border[3])
      ..lineTo(0, size.height - border[3])
      ..close();

    canvas.drawPath(leftBorder, leftPaint);

    leftPaint.color = leftColorBorder; //Color(0xFF50C7FF);

    leftBorder = Path();
    leftBorder
      ..moveTo(border[3], size.height - border[3])
      ..lineTo(border[3], border[3])
      ..lineTo(border[3] - 5, border[3])
      ..lineTo(border[3] - 5, size.height - border[3])
      ..close();

    canvas.drawPath(leftBorder, leftPaint);

    // canvas.drawRRect(
    //     RRect.fromRectAndRadius(Rect.fromLTWH(size.width - 110, 0, 110, 110),
    //         const Radius.circular(16.0)),
    //     topPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class HomeDesktopPage extends StatefulWidget {
  const HomeDesktopPage({
    Key? key,
  }) : super(key: key);

  @override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: const Color(0xFF0a062f),
        // appBar: PreferredSize(
        //   preferredSize: Size(100, 120), //width and height
        //   child: Column(children: [
        //     Container(
        //         height: 100,
        //         decoration: const BoxDecoration(
        //           border: Border(
        //             bottom: BorderSide(width: 3.5, color: Color(0xFF5f5def)),
        //           ),
        //           color: Color(0xFF0E101E),
        //         ),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Padding(
        //                 padding: const EdgeInsets.all(7.0),
        //                 child: GestureDetector(
        //                     onTap: () => {},
        //                     child: AnimatedContainer(
        //                         width: 80,
        //                         height: 80,
        //                         duration: const Duration(seconds: 1),
        //                         curve: Curves.fastOutSlowIn,
        //                         child: Row(children: [
        //                           Container(
        //                               width: 80,
        //                               height: 80,
        //                               padding: const EdgeInsets.all(3.0),
        //                               child: RiveAnimation.network(
        //                                   "https://s3.amazonaws.com/cdn.codewithcorgis.com/animations/logo.riv",
        //                                   alignment: Alignment.center,
        //                                   fit: BoxFit.cover,
        //                                   animations: const [
        //                                     "still",
        //                                   ]))
        //                         ])))),
        //           ],
        //         ))
        //   ]),
        // ),
        appBar: PreferredSize(
            preferredSize: Size(100, 100),
            child: Container(
              //color: Colors.red,
              child: Column(children: [
                Container(
                    height: 100,
                    // decoration: const BoxDecoration(
                    //   border: Border(
                    //     bottom:
                    //         BorderSide(width: 3.5, color: Color(0xFF5f5def)),
                    //   ),
                    //   color: Color(0xFF0E101E),
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: GestureDetector(
                                onTap: () => {},
                                child: AnimatedContainer(
                                 // color: Colors.red,
                                    width: 160,
                                    height: 80,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.fastOutSlowIn,
                                    child: Row(children: [
                                      Container(
                                          width: 80,
                                          height: 80,
                                          padding: const EdgeInsets.all(3.0),
                                          child: RiveAnimation.network(
                                              "https://s3.amazonaws.com/cdn.codewithcorgis.com/animations/logo.riv",
                                              alignment: Alignment.center,
                                              fit: BoxFit.cover,
                                              animations: const [
                                                "still",
                                              ])),
                                      Text(
                                        "corgis",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      )
                                    ])))),
                      ],
                    ))
              ]),
              margin: const EdgeInsets.only(left: 30.0, right: 35.0),
            )),
        body: CustomPaint(
            painter: BorderFrame(
                topColor: const Color(0xFF1098fc),
                topColorBorder: const Color(0xFF50C7FF),
                rightColor: const Color(0xFF1098fc),
                rightColorBorder: const Color(0xFF50C7FF),
                bottomColor: const Color(0xFF1098fc),
                bottomColorBorder: const Color(0xFF50C7FF),
                leftColor: const Color(0xFF1098fc),
                leftColorBorder: const Color(0xFF50C7FF),
                border: [30, 30, 30, 30]),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height)));
  }
}
