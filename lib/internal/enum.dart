import 'package:fluent_ui/fluent_ui.dart';
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
  wild,
  spring,
  summer,
  autumn,
  winter,
  ;

  const SeasonType();
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

	const CardRarity();

}

enum CardElementPositionType{

  cost(ElementPositions(relativePosition: Offset(0.07, 0.05))),
  seasonRequirement(ElementPositions(relativePosition: Offset(0.08, 0.00))),
  name(ElementPositions(relativePosition: Offset(0.4, 0.08))),
  gem(ElementPositions(relativePosition: Offset(0.01, 0.02))),
  image(ElementPositions(relativePosition: Offset(0.01, 0.02))),
  attack(ElementPositions(relativePosition: Offset(0.01, 0.02))),
  health(ElementPositions(relativePosition: Offset(0.01, 0.02))),
  typeTag(ElementPositions(relativePosition: Offset(0.5, 0.95))),
  ;

  final ElementPositions relativePosition;
  

  const CardElementPositionType(this.relativePosition);
}
