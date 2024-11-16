import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Widget icon;
  final function;
  static bool holdingButton = false;

  bool userIsHoldingButton() {
    return holdingButton;
  }

  MyButton({super.key, required this.icon, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        holdingButton = true;
        function();
      },
      onTapUp: (details) {
        holdingButton = false;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.brown[300],
          child: icon,
        ),
      ),
    );
  }
}
