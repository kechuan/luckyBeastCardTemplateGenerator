
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';

String convertCardTypeImageUrl(SeasonType? seasonType, {CardType? cardType}){

    if(cardType == null){
      return switch (seasonType) {
        SeasonType.wild => "${APPRepository.officalElementTemplate}/wild.png",
        SeasonType.spring => "${APPRepository.officalElementTemplate}/spring.png",
        SeasonType.summer => "${APPRepository.officalElementTemplate}/summer.png",
        SeasonType.autumn => "${APPRepository.officalElementTemplate}/autumn.png",
        SeasonType.winter => "${APPRepository.officalElementTemplate}/winter.png",
        _ => "${APPRepository.officalElementTemplate}/mana.png",

      };
    }

    else{

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

      return "$targetResourcePath/${seasonType!.name}_$cardTypeSuffix.png";
  }
  
}