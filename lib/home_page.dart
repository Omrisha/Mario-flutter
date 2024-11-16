import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:super_mario/button.dart';
import 'package:super_mario/jumpingMario.dart';
import 'package:super_mario/mario.dart';
import 'package:super_mario/shroom.dart';
import 'package:super_mario/state/app_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var gameFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, fontSize: 20));
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                  child: AnimatedContainer(
                    alignment: Alignment(appState.marioX, appState.marioY),
                    duration: const Duration(milliseconds: 0),
                    child: appState.midJump
                        ? JumpingMario(
                            size: appState.marioSize,
                            direction: appState.direction,
                          )
                        : MyMario(
                            size: appState.marioSize,
                            direction: appState.direction,
                            midrun: appState.midRun,
                          ),
                  ),
                ),
                Container(
                  alignment: Alignment(appState.shroomX, appState.shroomY),
                  child: Shroom(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            "MARIO",
                            style: gameFont,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("0000", style: gameFont)
                        ],
                      ),
                      Column(
                        children: [
                          Text("WORLD", style: gameFont),
                          SizedBox(
                            height: 10,
                          ),
                          Text("1-1", style: gameFont)
                        ],
                      ),
                      Column(
                        children: [
                          Text("TIME", style: gameFont),
                          SizedBox(
                            height: 10,
                          ),
                          Text("9999", style: gameFont),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.green,
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MyButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      function: () {
                        appState.moveLeft();
                      },
                    ),
                    MyButton(
                      icon: const Icon(
                        Icons.arrow_upward,
                        color: Colors.white,
                      ),
                      function: () {
                        appState.jump();
                      },
                    ),
                    MyButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      function: () {
                        appState.moveRight();
                      },
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
