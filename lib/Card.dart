class GameCard {

  String suit;
  String number;
  int value;
  bool isAce;
  var assetPath = "";

  GameCard(this.suit, this.number, this.value, this.isAce) {
    assetPath = getAssetPath();
  }

  String getAssetPath() {
    return "$number\_of_$suit\.png";
  }

}