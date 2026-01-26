import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';



enum NavItem{
  //menu(WindowsIcons.global_nav_button),
  picture(WindowsIcons.picture),
  palette(WindowsIcons.pen_palette)
  ;

  final IconData icon;

  const NavItem(this.icon);
}

enum SeasonType{
  wild(Color.fromARGB(200, 0, 0, 0)),
  spring(Color.fromARGB(200, 56, 134, 108)),
  summer(Color.fromARGB(200, 159, 34, 61)),
  autumn(Color.fromARGB(200, 186, 133, 20)),
  winter(Color.fromARGB(200, 75, 116, 164)),
  ;

  final Color color;

  const SeasonType(this.color);
}

enum CardType{
  minion,
  spellcard,
  construction,
  ;

  const CardType();

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

enum CardElementPositionType{

  
  name(),
  cost(),
  
  
  gem(),
  seasonRequirement(),
  image(),
  attack(),
  health(),
  inherentTag(),
  typeTag(),
  description(),
  ;

  //final ElementPosition elementPosition;
  
  //const CardElementPositionType(this.elementPosition);
  const CardElementPositionType();


  bool isTextElement(){
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
