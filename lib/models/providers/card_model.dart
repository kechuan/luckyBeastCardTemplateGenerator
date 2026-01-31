import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_details.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';

class CardModel extends ChangeNotifier{

  CardModel();

  CardDetails cardDetails = CardDetails();

  Map<CardElementPositionType, ElementPosition> cardElementPosition = {
    for (final cardElementPositionType in CardElementPositionType.values) cardElementPositionType : ElementPosition(),
  };

  void updateCardImageUrl(String newImageUrl) {
    updateCardDetails(
      cardDetails.copyWith(
        imageUrl: newImageUrl
      )
    );
    notifyListeners();
  }

  void updateCardType(CardType newCardType) {
    updateCardDetails(
      cardDetails.copyWith(
        cardType: newCardType
      )
    );
    notifyListeners();
  }

  void updateAttack(int newAttack) {
    updateCardDetails(
      cardDetails.copyWith(
        attack: newAttack
      )
    );
    notifyListeners();
  }

  void updateHealth(int newHealth) {
    updateCardDetails(
      cardDetails.copyWith(
        health: newHealth
      )
    );
    notifyListeners();
  }

  void updateSeasonType(Set<SeasonType> newSeasonTypeSet) {
    updateCardDetails(
      cardDetails.copyWith(
        seasonTypeSet: newSeasonTypeSet
      )
    );
    notifyListeners();
  }

  void updateMixedType(bool newState) {
    updateCardDetails(
      cardDetails.copyWith(
        isMixed: newState
      )
    );
    notifyListeners();
  }

  void updateName(String newName) {
    updateCardDetails(
      cardDetails.copyWith(
        name: newName
      )
    );
    notifyListeners();
  }

  void updateCost(int newCost) {
    updateCardDetails(
      cardDetails.copyWith(
        cost: newCost
      )
    );
    notifyListeners();
  }

  void updateSeasonRequirement(List<int> newSeasonRequirement) {
    updateCardDetails(
      cardDetails.copyWith(
        seasonRequirement: newSeasonRequirement
      )
    );
    notifyListeners();
  }

  void updateRarity(CardRarity newRarity) {
    updateCardDetails(
      cardDetails.copyWith(
        cardRarity: newRarity
      )
    );
    notifyListeners();
  }

  void updateImageUrl(String? newImageUrl) {
    updateCardDetails(
      cardDetails.copyWith(
        imageUrl: newImageUrl
      )
    );
    notifyListeners();
  }

  void updateminionTags(List<String> newTags) {
    updateCardDetails(
      cardDetails.copyWith(
        minionTags: newTags
      )
    );

    notifyListeners();
  }

  void updateDescription(String newDescription) {
    updateCardDetails(
      cardDetails.copyWith(
        description: newDescription
      )
    );

    notifyListeners();
  }

  void updateCardDetails(CardDetails newCardDetails) {
    cardDetails = newCardDetails;
    notifyListeners();
  }

  void reset() {
    cardDetails = CardDetails();
    notifyListeners();
  }

  set updateCardElementPosition(Map<CardElementPositionType, ElementPosition> newElementPosition) {
    cardElementPosition = newElementPosition;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }


}
