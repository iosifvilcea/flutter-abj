import 'package:flutter/material.dart';
import 'package:alphablackjack/GamePage.dart';
import 'package:alphablackjack/BlackjackGame.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(new AlphaBlackJackApp());
}

class AlphaBlackJackApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlphaBlackJackAppState();

}

class _AlphaBlackJackAppState extends State<AlphaBlackJackApp> {

  BlackjackGame _gameEngine;

  @override
  void initState() {
    super.initState();
    _gameEngine = BlackjackGame();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AlphaBlackJack',
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        home: GamePage(_gameEngine),
    );
  }

}