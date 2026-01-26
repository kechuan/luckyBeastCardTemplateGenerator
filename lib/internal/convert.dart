
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';

String convertCardTypeImageUrl({
  Set<SeasonType> seasonTypeSet = const {},
  CardType cardType = CardType.minion,
}) {

  String targetResourcePath = "";
  String cardTypeSuffix = "";

  switch (cardType) {
    case CardType.minion:{
      targetResourcePath = APPRepository.officalMinionTemplate;
      cardTypeSuffix = CardType.minion.name;

    }
    case CardType.spellcard:{
      targetResourcePath = APPRepository.officalSpellTemplate;
      cardTypeSuffix = CardType.spellcard.name;

    }
    case CardType.construction:{
      targetResourcePath = APPRepository.officalConstructionTemplate;
      cardTypeSuffix = CardType.construction.name;

    }
  }

  final orderSeasonList = seasonTypeSet.toList()..sort((a, b) => a.index.compareTo(b.index));

  return switch(orderSeasonList.length){
    0 => "$targetResourcePath/${SeasonType.wild.name}_$cardTypeSuffix.png",
    1 => "$targetResourcePath/${orderSeasonList.first.name}_$cardTypeSuffix.png",
    2 => "$targetResourcePath/${orderSeasonList.first.name}_${orderSeasonList.last.name}_$cardTypeSuffix.png",
    _ => "",

  };

  


}

String convertElementTypeImageUrl(
{
  SeasonType? seasonType,
}
) {
  return switch (seasonType) {
    SeasonType.wild => "${APPRepository.officalElementTemplate}/wild.png",
    SeasonType.spring => "${APPRepository.officalElementTemplate}/spring.png",
    SeasonType.summer => "${APPRepository.officalElementTemplate}/summer.png",
    SeasonType.autumn => "${APPRepository.officalElementTemplate}/autumn.png",
    SeasonType.winter => "${APPRepository.officalElementTemplate}/winter.png",
    _ => "${APPRepository.officalElementTemplate}/mana.png",

  };
}

String convertCardRarityTypeImageUrl(CardRarity cardRarity)
  => "${APPRepository.officalRarityTemplate}/${cardRarity.name}.png";
