import 'dart:math';

import 'package:flutter/material.dart';

class JumpingMario extends StatelessWidget {
  final String direction;
  final size;

  JumpingMario({super.key, this.size, required this.direction});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: size,
        height: size,
        child: Image.asset('assets/images/jumpingMario.png'),
      );
    } else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: size,
          height: size,
          child: Image.asset('assets/images/jumpingMario.png'),
        ),
      );
    }
  }
}
