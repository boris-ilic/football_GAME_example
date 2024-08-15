import 'package:flutter/material.dart';
import 'package:football_game/screens/start_game_screen.dart';

void main() {
  runApp(MaterialApp(
    title: 'PANDA-monium',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const StartGameScreen(),
  ));
}
