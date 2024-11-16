import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:super_mario/button.dart';

class MyAppState extends ChangeNotifier {
  double marioX = 0;
  double marioY = 1;
  double shroomX = 0.5;
  double shroomY = 1;
  double time = 0;
  double height = 0;
  double marioSize = 50;
  double initialHeight = 1;
  String direction = "right";
  bool midRun = false;
  bool midJump = false;

  void ateShroom() {
    if ((marioX - shroomX).abs() < 0.05 && (marioY - shroomY).abs() < 0.05) {
      marioSize = 100;
      shroomX = 2;
      notifyListeners();
    }
  }

  void preJump() {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    if (midJump == false) {
      midJump = true;
      preJump();
      Timer.periodic(const Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initialHeight - height > 1) {
          marioY = 1;
          midJump = false;
          timer.cancel();
          notifyListeners();
        } else {
          marioY = initialHeight - height;
          notifyListeners();
        }
      });
    }
  }

  void moveRight() {
    direction = "right";

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      ateShroom();
      if (MyButton.holdingButton == true && marioX + 0.02 < 1) {
        marioX += 0.02;
        midRun = !midRun;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });

    marioX += 0.02;
    notifyListeners();
  }

  void moveLeft() {
    direction = "left";

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      ateShroom();
      if (MyButton.holdingButton == true && marioX - 0.02 > -1) {
        marioX -= 0.02;
        midRun = !midRun;
        notifyListeners();
      } else {
        timer.cancel();
      }
    });

    marioX -= 0.02;
    notifyListeners();
  }
}
