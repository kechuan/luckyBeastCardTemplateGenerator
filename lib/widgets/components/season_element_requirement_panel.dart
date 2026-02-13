
import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/internal/extensions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/general_number_input_box.dart';
import 'package:provider/provider.dart';

class SeasonRequirementPanel extends StatefulWidget {
  const SeasonRequirementPanel({super.key});

  @override
  State<SeasonRequirementPanel> createState() => _SeasonRequirementPanelState();
}

class _SeasonRequirementPanelState extends State<SeasonRequirementPanel> {

  late final List<TextEditingController> elementsTextEditingControllers;
  late final TextEditingController manaTextEditingControllers;

  @override
  void initState() {

    if (mounted) {
      final cardModel = context.read<CardModel>();

      manaTextEditingControllers = TextEditingController(text: cardModel.cardDetails.cost.toString());

      manaTextEditingControllers.addListener((){
        cardModel.updateCost(int.tryParse(manaTextEditingControllers.text) ?? 0);
      });

      elementsTextEditingControllers = List.generate(SeasonType.values.length, (index) {

        return TextEditingController(
          text: cardModel.cardDetails.seasonRequirement[index].toString()
        )..addListener((){
          
          cardModel.updateSeasonRequirement(cardModel.cardDetails.seasonRequirement.copyWithReplace(index, int.tryParse(elementsTextEditingControllers[index].text) ?? 0));

        });
      });

    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expander(
      initiallyExpanded: false,
      header: Text(t.cardPropPanel.seasonElementSelect.seasonElementRequirement),
      content: Column(
        spacing: 12,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 12,

            children: [

              Image.asset(
                convertElementTypeImageUrl(),
                scale: 2,
              ),

              ValueListenableBuilder(
                valueListenable: manaTextEditingControllers,
                builder: (_, manaText, _) {
                  return Flexible(
                    child: Slider(
                      min: 0,
                      max: 20,
                      value: (double.tryParse(manaText.text) ?? 0).clamp(0, 20),
                      onChanged: (value) {
                        manaTextEditingControllers.text = value.toStringAsFixed(0);
                      },

                    ),
                  );
                }
              ),

              GeneralNumberInputBox(textEditingController: manaTextEditingControllers)
            ],
          ),

          //ElementTextField
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: List.generate(SeasonType.values.length, (index) {
                return GeneralNumberInputBox(textEditingController: elementsTextEditingControllers[index]);
              }),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: List.generate(SeasonType.values.length, (index) {
                return Column(
                  spacing: 3,
                  children: [

                    Image.asset(
                      convertElementTypeImageUrl(seasonType: SeasonType.values[index]),
                      scale: 2,
                    ),

                    ValueListenableBuilder(
                      valueListenable: elementsTextEditingControllers[index],
                      builder: (_, textValue, _) {
                        return Slider(
                          vertical: true,
                          min: 0,
                          max: 6,
                          value: double.tryParse(textValue.text)?.clamp(0, 6) ?? 0,
                          divisions: 6,
                          onChanged: (value) {
                            //final cardModel = context.read<CardModel>();
                            elementsTextEditingControllers[index].text = value.toStringAsFixed(0);
                            //cardModel.updateSeasonRequirement = cardModel.cardDetails.seasonRequirement.copyWithReplace(index, value.toInt());

                          },

                        );
                      }
                    )

                  ],
                );
              })

          ),
        ],
      ),
    );
  }
}
