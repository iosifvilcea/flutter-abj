import 'package:alphablackjack/Card.dart';

class Hand {

  GameCard card1;
  GameCard card2;
  int handTotal = 0;

  Hand(this.card1, this.card2) {
    handTotal = this.card1.value + this.card2.value;
  }

}
