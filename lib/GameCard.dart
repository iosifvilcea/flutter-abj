class GameCard {

  static const DEFAULT_ASSET_PATH = "black_joker.png";

  String suit;
  String number;
  int value;
  bool isAce;
  var assetPath = "";

  GameCard(this.suit, this.number, this.value, this.isAce) {
    assetPath = getAssetPath();
  }

  GameCard.empty() {
    suit = "";
    number = "0";
    value = 0;
    isAce = false;
    assetPath = DEFAULT_ASSET_PATH;
  }

  String getAssetPath() {
    return "$number\_of_$suit\.png";
  }

}