import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';



enum NavItem{
  //menu(WindowsIcons.global_nav_button),
  //picture(WindowsIcons.picture),
  palette(WindowsIcons.pen_palette)
  ;

  final IconData icon;

  const NavItem(this.icon);

  String get text => t['navigationPanel.$name'] ?? "";
}

enum SeasonType{
  wild(Color.fromARGB(200, 199, 199, 199)),

  //默认的颜色映射出来确实不好看 只能调亮了
  //Color.fromARGB(200, 56, 134, 108)
  spring(Color.fromARGB(155, 130, 199, 132)),
  summer(Color.fromARGB(200, 159, 34, 61)),
  

  //same issue
  //原始数据: autumn(Color.fromARGB(200, 186, 133, 20)),
  autumn(Color.fromARGB(200, 230, 191, 106)),
  winter(Color.fromARGB(200, 75, 116, 164)),
  ;

  final Color color;

  const SeasonType(this.color);
}

enum CardType{
  familliar,
  spellcard,
  player,
  construction,
  ;

  const CardType();

  bool isChess() => 
    this == CardType.familliar ||
    this == CardType.player ||
    this == CardType.construction
  ;

  String get text => t['cardPropPanel.cardDetail.cardType.$name'] ?? "";

}

enum CardRarity{
  normal(),
  unusual(),
  rare(),
  mythic()

  ;

  //String get text => t['common.${name}'];
  String get text => t['cardPropPanel.basicProp.cardRarity.$name'] ?? "";

  const CardRarity();



}

///与stack布局的顺序挂钩
enum CardElementPositionType{
  image,
  maskLayer,
  description,
  
  name,
  typeTag,

  cost,

  gem,
  seasonRequirement,
  
  attack,
  health,
  
  
  
  ;

  //冲突避免 如果直接用 name 会锁定到枚举定义值上
  String get text => t['cardPropPanel.elementPositions.cardElementPositionType.${EnumName(this).name}'] ?? "";
  

  const CardElementPositionType();

  bool isTextElement() {
    return switch (this) {
      CardElementPositionType.name ||
      CardElementPositionType.cost ||
      CardElementPositionType.attack ||
      CardElementPositionType.health ||
      CardElementPositionType.typeTag => true,
      _ => false,
    };
  }

  
  

}
