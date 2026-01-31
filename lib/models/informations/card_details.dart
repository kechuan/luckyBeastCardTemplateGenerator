import 'package:lucky_beast_card_template_generator/internal/enum.dart';

class CardDetails{

  CardDetails({
    this.name,
    this.imageUrl,
    this.seasonTypeSet = const {},
    this.isMixed = false,
    this.cardType = CardType.minion,
    this.cost = 0,
    this.seasonRequirement = const [0,0,0,0,0],
    this.cardRarity = CardRarity.normal,
    this.minionTags = const [],
    this.description,
    this.attack,
    this.health

  });

  //基础信息
  String? name;
  String? imageUrl;

  //涉及卡面背景 & 种类
  Set<SeasonType> seasonTypeSet = {};
  bool isMixed = false;
  CardType cardType = CardType.minion;

  //费用与类别
  int? cost = 0;
  List<int> seasonRequirement = [0,0,0,0,0];
  CardRarity cardRarity = CardRarity.normal;


  List<String> minionTags = [];
  String? description;

  int? attack = 0;
  int? health = 0;

  CardDetails copyWith({
    String? title,
    String? imageUrl,
    Set<SeasonType>? seasonTypeSet,
    bool? isMixed,
    CardType? cardType,
    int? cost,
    List<int>? seasonRequirement,
    CardRarity? cardRarity,
    List<String>? minionTags,
    String? description,
    int? attack,
    int? health,
    String? name
  }){
    return CardDetails(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      seasonTypeSet: seasonTypeSet ?? this.seasonTypeSet,
      isMixed: isMixed ?? this.isMixed,
      cardType: cardType ?? this.cardType,
      cost: cost ?? this.cost,
      seasonRequirement: seasonRequirement ?? this.seasonRequirement,
      cardRarity: cardRarity ?? this.cardRarity,
      minionTags: minionTags ?? this.minionTags,
      description: description ?? this.description,
      attack: attack ?? this.attack,
      health: health ?? this.health
    );
  }

}
