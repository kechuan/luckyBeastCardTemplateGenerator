import 'package:flutter/foundation.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_details.dart';

class CardModel extends ChangeNotifier{

  CardModel();

  CardDetails cardDetails = CardDetails();

  set updateCardType(CardType newCardType) {
    cardDetails.cardType = newCardType;
    notifyListeners();
  }

  set updateAttack(int newAttack) {
    cardDetails.attack = newAttack;
    notifyListeners();
  }

  set updateHealth(int newHealth) {
    cardDetails.health = newHealth;
    notifyListeners();
  }

  set updateSeasonType(SeasonType newSeasonType) {
    cardDetails.seasonType = newSeasonType;
    notifyListeners();
  }

  set updateName(String newName) {
    cardDetails.name = newName;
    notifyListeners();
  }

  set updateCost(int newCost) {
    cardDetails.cost = newCost;
    notifyListeners();
  }

  set updateSeasonRequirement(List<int> newSeasonRequirement) {
    cardDetails.seasonRequirement = newSeasonRequirement;
    notifyListeners();
  }

  set updateImageUrl(String newImageUrl) {
    cardDetails.imageUrl = newImageUrl;
    notifyListeners();
  }

  set updateInherentTags(List<String> newTags) {
    cardDetails.inherentTags = newTags;
    notifyListeners();
  }

  set updateDescription(String newDescription) {
    cardDetails.description = newDescription;
    notifyListeners();
  }

  void reset() {
    cardDetails = CardDetails();
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }


}
