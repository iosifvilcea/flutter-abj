import 'dart:math';
import 'package:alphablackjack/Hand.dart';
import 'package:alphablackjack/Card.dart';


class Gameplay {

  static final cardNames = ['clubs','diamonds', 'hearts', 'spades'];
  static final cardNumbers = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'];
  static final lowestHighCardPosition = 8;
  static final acePosition = 12;

  var random = Random();

  Hand player;
  Hand dealer;

  void init() {
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

  void deal() {

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