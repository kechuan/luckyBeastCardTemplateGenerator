import 'package:lucky_beast_card_template_generator/internal/enum.dart';

///按照布局位置进行排列
class CardDetails {

  //基础信息
  String? name;
  String? imageUrl;

  //涉及卡面背景 & 种类
  SeasonType seasonType = SeasonType.wild;
  CardType cardType = CardType.minion;

  //费用与类别
  int? cost = 0;
  List<int> seasonRequirement = [0,0,0,0,0];


  CardRarity? cardRarity;


  List<String> inherentTags = [];
  String? description;

  List<String> minionType = [];

  int? attack = 0;
  int? health = 0;
  


  
}
