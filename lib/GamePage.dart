import 'package:flutter/material.dart';
import 'package:alphablackjack/BlackjackGame.dart';
import 'package:alphablackjack/widgets/GameCardWidget.dart';


class GamePage extends StatefulWidget {
  final BlackjackGame _engine;

  GamePage(this._engine);

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
  BlackjackGame _engine;

  var playerTotal = 0;
  var dealerTotal = 0;
  var playerTotalWinnings = 0;

  VoidCallback topLeftButtonCallback;
  VoidCallback topRightButtonCallback;
  VoidCallback bottomRightButtonCallback;

  void setGameText() {
    topRightButtonText = HIT_TEXT;
    bottomRightButtonText = STAND_TEXT;
    topLeftButtonText = DOUBLE_DOWN_TEXT;
  }

  void deal() {
    _engine.deal();
    playerTotal = _engine.getPlayerCurrentTotal();
    dealerTotal = 0;
  }

  void hit() {
    _engine.hit();
    playerTotal = _engine.getPlayerCurrentTotal();
    dealerTotal = _engine.getDealerCurrentTotal();
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
          GameCardWidget(_engine.getDealerFirstCardAssetPath()),
          Text('$dealerTotal'),
          GameCardWidget(_engine.getDealerSecondCardAssetPath())
        ],
      );
    }

    Row buildPlayerCardRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          GameCardWidget(_engine.getPlayerFirstCardAssetPath()),
          Text('$playerTotal'),
          GameCardWidget(_engine.getPlayerSecondCardAssetPath())
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