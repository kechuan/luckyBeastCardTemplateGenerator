import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_description_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/minion_prop_panel.dart';
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
          header: Text(t.cardPropPanel.cardDetail.name),
          content: Column(
            spacing: 12,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 6,
                children: [
                  Text(t.cardPropPanel.cardDetail.cardType.name),
				  
                  ComboBox<CardType>(
                    value: cardType,
                    items: [
                      ComboBoxItem(
                        value: CardType.minion,
                        child: Text(CardType.minion.text),
                      ),

                      ComboBoxItem(
                        value: CardType.spellcard,
                        child: Text(CardType.spellcard.text),
                      ),

                      ComboBoxItem(
                        value: CardType.construction,
                        child: Text(CardType.construction.text),
                      ),

                    ],

                    onChanged: (value) {
                      cardModel.updateCardType(value!);
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
