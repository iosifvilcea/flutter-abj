import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Row buildDealerCardRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GameCardWidget(),
          GameCardWidget()
        ],
      );
    }

    Row buildPlayerCardRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GameCardWidget(),
          GameCardWidget()
        ],
      );
    }

    Row buildGameButtonsRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Click'),
            onPressed: null,
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Click B'),
            onPressed: null,
          ),
        ],
      );
    }

    return MaterialApp(
        title: 'AlphaBlackJack',
        theme: ThemeData(
            primarySwatch: Colors.blue
        ),
        home: Scaffold(
            appBar: AppBar(
                title: Text('AlphaBlackJack'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  buildDealerCardRow(),
                  buildPlayerCardRow(),
                  buildGameButtonsRow(),
                  buildGameButtonsRow(),
                  Text('Score: 1000'),
                ],
              ),
            ),
        ),
    );
  }
}

class GameCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        'assets/playing_cards/2_of_clubs.png',
        height: 100.0,
        fit: BoxFit.fill,
      ),
    );
  }


}
