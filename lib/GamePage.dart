import 'package:flutter/material.dart';
import 'package:alphablackjack/Game.dart';
import 'package:alphablackjack/widgets/GameCardWidget.dart';


class GamePage extends StatefulWidget {

  final Game _gameEngine;
  GamePage(this._gameEngine);

  @override
  State<StatefulWidget> createState() => GamePageState();
}


class GamePageState extends State<GamePage> {

  static const BET_TEXT = 'Bet';
  static const HIT_TEXT = 'Hit';
  static const STAND_TEXT = 'Stand';
  static const DOUBLE_DOWN_TEXT = 'Double Down';
  static const DEAL_TEXT = 'Deal';

  String topLeftButtonText = "";
  String topRightButtonText = "";
  String bottomRightButtonText = "";

  var infoText;
  Game gameplay;

  var playerTotal = 0;
  var dealerTotal = 0;
  var playerTotalWinnings = 0;

  VoidCallback topLeftButtonCallback;
  VoidCallback topRightButtonCallback;
  VoidCallback bottomRightButtonCallback;

  @override
  initState() {
    super.initState();
    gameplay.newGame();
  }

  void setGameText() {
    topRightButtonText = HIT_TEXT;
    bottomRightButtonText = STAND_TEXT;
    topLeftButtonText = DOUBLE_DOWN_TEXT;
  }

  void deal() {
    gameplay.deal();
    playerTotal = gameplay.getPlayerCurrentTotal();
    dealerTotal = 0;
  }

  void hit() {
    gameplay.hit();
    playerTotal = gameplay.getPlayerCurrentTotal();
    dealerTotal = gameplay.getDealerCurrentTotal();
  }

  void setBetStates() {
    topLeftButtonText = "";
    topRightButtonText = DEAL_TEXT;
    bottomRightButtonText = "";

    topLeftButtonCallback = null;
    bottomRightButtonCallback = null;
    topRightButtonCallback = () => setDealStates();
  }

  void setDealStates() {
    setState(() {
      setGameText();
      deal();

      topRightButtonCallback = () => setHitStates();
      bottomRightButtonCallback = () => {};
      topLeftButtonCallback = () => {};
    });
  }

  void setHitStates() {
    setState(() {
      hit();

      topRightButtonCallback = () => hit;
      bottomRightButtonCallback = () => stand;
      topLeftButtonCallback = () => doubleDown;
    });

  }

  void stand() {
    // TODO  FLIP DEALER.
    // TODO  SHOW WHO WINS.
    // TODO  RESET.
  }

  void doubleDown() {
    // TODO  DD.
  }

  @override
  Widget build(BuildContext context) {
    Row buildDealerCardRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GameCardWidget(gameplay.getDealerFirstCardAssetPath()),
          Text('$dealerTotal'),
          GameCardWidget(gameplay.getDealerSecondCardAssetPath())
        ],
      );
    }

    Row buildPlayerCardRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GameCardWidget(gameplay.getPlayerFirstCardAssetPath()),
          Text('$playerTotal'),
          GameCardWidget(gameplay.getPlayerSecondCardAssetPath())
        ],
      );
    }

    Row buildGameButtonTopRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(topLeftButtonText),
            onPressed: topLeftButtonCallback,
          ),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(topRightButtonText),
            onPressed: topRightButtonCallback,
          ),
        ],
      );
    }

    Row buildGameButtonBottomRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(""),
          FlatButton(
            color: Colors.blue,
            textColor: Colors.white,
            child: Text(bottomRightButtonText),
            onPressed: bottomRightButtonCallback,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('AlphaBlackJack'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildDealerCardRow(),
            buildPlayerCardRow(),
            buildGameButtonTopRow(),
            buildGameButtonBottomRow(),
            Text('$playerTotalWinnings'),
          ],
        ),
      ),
    );
  }
}