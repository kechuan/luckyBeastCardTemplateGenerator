import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';



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
	treasure()
	
	;

  //String get text => t['common.${name}'];
  String get text => t['cardPropPanel.basicProp.cardRarity.$name'];

	const CardRarity();



}

enum CardElementPositionType{

  name(ElementPositions(relativePosition: Offset(0.40, 0.105),relativeSize: 0.2)),
  cost(ElementPositions(relativePosition: Offset(0.088, 0.06),relativeSize: 0.11)),
  seasonRequirement(ElementPositions(relativePosition: Offset(0.08, 0.00),relativeSize: 0.2)),
  
  gem(ElementPositions(relativePosition: Offset(0.01, 0.02),relativeSize: 0.2)),
  image(ElementPositions(relativePosition: Offset(0.25, 0.19),relativeSize: 0.5)),
  attack(ElementPositions(relativePosition: Offset(0.133, 0.84),relativeSize: 0.1)),
  health(ElementPositions(relativePosition: Offset(0.763, 0.845),relativeSize: 0.1)),
  inherentTag(ElementPositions(relativePosition: Offset(0.5, 0.95),relativeSize: 0.2)),
  typeTag(ElementPositions(relativePosition: Offset(0.5, 0.95),relativeSize: 0.2)),
  description(ElementPositions(relativePosition: Offset(0.5, 0.95),relativeSize: 0.2)),
  ;

  final ElementPositions elementPositions;
  
  const CardElementPositionType(this.elementPositions);


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
