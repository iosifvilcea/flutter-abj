import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:alphablackjack/Card.dart';
import 'package:alphablackjack/Gameplay.dart';

void main() {
//  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

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

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  var playerTotalWinnings = 0;
  String path = "";
  Gameplay gameplay;
  int playerTotal = 0;
  int dealerTotal = 0;

  HomePageState() {
    gameplay = Gameplay();
    gameplay.init();
    playerTotal = gameplay.player.handTotal;
    dealerTotal = gameplay.dealer.handTotal;
  }

  void bet() {
    setState(() {
      gameplay.init();
      playerTotal = gameplay.player.handTotal;
      dealerTotal = gameplay.dealer.handTotal;
    });
  }

  @override
  Widget build(BuildContext context) {

    Row buildDealerCardRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GameCardWidget(gameplay.dealer.card1.assetPath),
          Text('$dealerTotal'),
          GameCardWidget(gameplay.dealer.card2.assetPath)
        ],
      );
    }

    Row buildPlayerCardRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GameCardWidget(gameplay.player.card1.assetPath),
          Text('$playerTotal'),
          GameCardWidget(gameplay.player.card2.assetPath)
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
            child: Text('Bet'),
            onPressed: bet,
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('--'),
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
              Text('$path'),
            ],
          ),
        ),
      ),
    );

  }

}
