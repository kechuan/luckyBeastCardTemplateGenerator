import 'package:flutter/widgets.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_details.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';

class CardModel extends ChangeNotifier{

  CardModel();

  CardDetails cardDetails = CardDetails();

  
  Map<CardElementPositionType,ElementPosition> cardElementPosition = {
    for(final cardElementPositionType in CardElementPositionType.values) cardElementPositionType : ElementPosition(),
  };



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

  set updateSeasonType(Set<SeasonType> newSeasonTypeSet) {
    cardDetails.seasonTypeSet = newSeasonTypeSet;
    notifyListeners();
  }

  set updateMixedType(bool newState) {
    cardDetails.isMixed = newState;
    notifyListeners();
  }

  set updateMinionType(List<String> newMinionType) {
    cardDetails.minionType = newMinionType;
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

  set updateRarity(CardRarity newRarity) {
    cardDetails.cardRarity = newRarity;
    notifyListeners();
  }

  set updateImageUrl(String newImageUrl) {
    cardDetails.imageUrl = newImageUrl;
    notifyListeners();
  }

  set updateCardElementPosition(Map<CardElementPositionType, ElementPosition> newElementPosition) {
    cardElementPosition = newElementPosition;
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
