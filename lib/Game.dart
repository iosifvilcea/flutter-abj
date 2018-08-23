import 'dart:math';
import 'package:alphablackjack/Hand.dart';
import 'package:alphablackjack/GameCard.dart';


class Game {

  static final cardNames = ['clubs','diamonds', 'hearts', 'spades'];
  static final cardNumbers = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'];
  static final lowestHighCardPosition = 8;
  static final acePosition = 12;

  var random = Random();

  Hand player;
  Hand dealer;
  
  void newGame() {
    player = Hand(GameCard.empty(), GameCard.empty());
    dealer = Hand(GameCard.empty(), GameCard.empty());
  }

  void deal() {
    player = getShuffledHand();
    dealer = getShuffledHand();
  }

  void bet() {

  }

  void hit() {

  }

  void stand() {

  }

  void doubleDown() {

  }

  int getPlayerCurrentTotal() {
    return player.handTotal;
  }

  int getDealerCurrentTotal() {
    return dealer.handTotal;
  }

  String getDealerFirstCardAssetPath() {
    if (dealer == null || dealer.card1 == null) {
      return GameCard.DEFAULT_ASSET_PATH;
    }

    return dealer.card1.assetPath;
  }

  String getDealerSecondCardAssetPath() {
    if (dealer == null || dealer.card2 == null) {
      return GameCard.DEFAULT_ASSET_PATH;
    }

    return dealer.card2.assetPath;
  }

  String getPlayerFirstCardAssetPath() {
    if (player == null || player.card1 == null) {
      return GameCard.DEFAULT_ASSET_PATH;
    }

    return player.card1.assetPath;
  }

  String getPlayerSecondCardAssetPath() {
    if (player == null || player.card2 == null) {
      return GameCard.DEFAULT_ASSET_PATH;
    }

    return player.card2.assetPath;
  }

  Hand getShuffledHand() {
    return Hand(
      getRandomCard(),
      getRandomCard()
    );
  }

  GameCard getRandomCard() {
    int cardValue = random.nextInt(12);
    String cardNumber = cardNumbers[cardValue];
    String cardSuit = cardNames[random.nextInt(3)];

    bool isAce = false;
    if (cardValue >= lowestHighCardPosition) {
      if (cardValue == acePosition) {
        isAce = true;
      }
      cardValue = 10;
    } else {
      cardValue = cardValue + 2;
    }

    return GameCard(cardSuit, cardNumber, cardValue, isAce);
  }

}