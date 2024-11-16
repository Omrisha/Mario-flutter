import 'package:flutter/material.dart';

class Shroom extends StatelessWidget {
  const Shroom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      child: Image.asset('assets/images/mushroom.png'),
    );
  }
}
