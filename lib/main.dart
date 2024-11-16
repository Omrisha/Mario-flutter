import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:super_mario/home_page.dart';
import 'package:super_mario/state/app_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: const MaterialApp(home: HomePage()),
    );
  }
}
