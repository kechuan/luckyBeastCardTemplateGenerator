import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/card_description_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/views/fluent_minion_prop.dart';
import 'package:provider/provider.dart';

class CardDetailsPanel extends StatelessWidget {
  const CardDetailsPanel({super.key});

  @override
  Widget build(BuildContext context) {

    final cardModel = context.read<CardModel>();

    return Selector<CardModel, CardType>(
      selector: (_, model) => cardModel.cardDetails.cardType,
      builder: (_, cardType, child) {
        return Expander(
          header: Text("详细数据"),
          content: Column(
            spacing: 12,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 6,
                children: [
                  Text(t.cardPropPanel.cardDetail.cardType),
				  
                  ComboBox<String>(
                    value: cardType.name,
                    items: [
                      ComboBoxItem(
                        value: CardType.minion.name,
                        child: Text("棋子"),
                      ),

                      ComboBoxItem(
                        value: CardType.spellcard.name,
                        child: Text("符卡"),
                      ),

                    ],

                    onChanged: (value) {
                      cardModel.updateCardType = switch (value) {
                        "entity" => CardType.minion,
                        "spellcard" => CardType.spellcard,
                        _ => CardType.minion,
                      };

                    },
                  ),
                ],
              ),

              if(cardType == CardType.minion) const FluentCardMinionTypeProp(),

			  Divider(),

			  CardDescriptionPanel(),
                
            
            ],
          )


        );
      }
    );
  }
}
