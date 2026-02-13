// ignore_for_file: constant_identifier_names

import 'package:fluent_ui/fluent_ui.dart';

class APPRepository{
  static const String officalTemplate = "assets/offical_card_template",
                      customTemplate = "assets/custom_card_template"
  ;

  static const String officalElementTemplate = "$officalTemplate/element_type",
                      officalConstructionTemplate = "$officalTemplate/construction_card",
                      officalMinionTemplate = "$officalTemplate/familliar_card",
                      officalSpellTemplate = "$officalTemplate/spell_card",
                      officalRarityTemplate = "$officalTemplate/rarity_type",

                      customConstructionTemplate = "$customTemplate/construction_card",
                      customElementTemplate = "$customTemplate/element_type",
                      customMinionTemplate = "$customTemplate/familliar_card",
                      customRarityTemplate = "$customTemplate/rarity_card"

    ;
                      

  static const String version = "0.3.1";
  static const String gameOfficalQQGroup = "305791725";
  static const String author = "kechuan";
  static const String githubRepository = "https://github.com/kechuan/luckyBeastCardTemplateGenerator";

}

/// 基准设计稿尺寸
const Size kCardDesignSize = Size(500, 700);

const List<String> kIllustrationType = [
  'jpg', 'jpeg', 'png', 'webp'  
];

const PaddingH6 = EdgeInsetsDirectional.symmetric(horizontal: 6);
const PaddingH12 = EdgeInsetsDirectional.symmetric(horizontal: 12);
const PaddingH16 = EdgeInsetsDirectional.symmetric(horizontal: 16);
const PaddingH24 = EdgeInsetsDirectional.symmetric(horizontal: 24);

const PaddingV6 = EdgeInsetsDirectional.symmetric(vertical: 6);
const PaddingV12 = EdgeInsetsDirectional.symmetric(vertical: 12);
const PaddingV16 = EdgeInsetsDirectional.symmetric(vertical: 16);
const PaddingV24 = EdgeInsetsDirectional.symmetric(vertical: 24);

const PaddingH6V16 = EdgeInsetsDirectional.symmetric(horizontal: 6,vertical: 16);
const PaddingH6V12 = EdgeInsetsDirectional.symmetric(horizontal: 6,vertical: 12);
const PaddingH12V6 = EdgeInsetsDirectional.symmetric(horizontal: 12,vertical: 6);
const PaddingH12V16 = EdgeInsetsDirectional.symmetric(horizontal: 12,vertical: 16);
const PaddingH16V12 = EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 12);
const PaddingH16V6 = EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 6);
const PaddingH16V24 = EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 24);

const Padding6 = EdgeInsetsDirectional.all(6);
const Padding12 = EdgeInsetsDirectional.all(12);
const Padding16 = EdgeInsetsDirectional.all(16);
const Padding24 = EdgeInsetsDirectional.all(24);