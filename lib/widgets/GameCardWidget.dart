import 'package:flutter/material.dart';

class GameCardWidget extends StatelessWidget {

  final String cardPath;

  GameCardWidget(this.cardPath);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/playing_cards/$cardPath',
        height: 100.0,
        fit: BoxFit.fill,
      ),
    );
  }

}

