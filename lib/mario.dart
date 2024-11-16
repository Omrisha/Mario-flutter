import 'dart:math';

import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {
  final String direction;
  final bool midrun;
  final size;

  MyMario(
      {super.key, this.size, required this.direction, required this.midrun});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: size,
        height: size,
        child: midrun
            ? Image.asset('assets/images/standingMario.png')
            : Image.asset('assets/images/runningMario.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: size,
          height: size,
          child: midrun
              ? Image.asset('assets/images/standingMario.png')
              : Image.asset('assets/images/runningMario.png'),
        ),
      );
    }
  }
}
