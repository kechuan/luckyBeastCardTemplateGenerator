import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/internal/extensions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:provider/provider.dart';

class CardBasicInformationPanel extends StatefulWidget {
  const CardBasicInformationPanel({super.key});

  @override
  State<CardBasicInformationPanel> createState() => _CardBasicInformationPanelState();
}

class _CardBasicInformationPanelState extends State<CardBasicInformationPanel> {

  final cardNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final cardModel = context.read<CardModel>();

    return Expander(
      initiallyExpanded: true,
      header: Text(t.cardPropPanel.basicProp.name),
      content: Column(
        spacing: 12,
        children: [

          Row(
            spacing: 12,
            children: [
              Icon(Icons.edit_document, size: 24),

              Expanded(
                child: TextBox(
                  controller: cardNameController,
                  placeholder: t.cardPropPanel.basicProp.cardName,
                  onChanged: (value) {
                    cardModel.updateName(cardNameController.text);
                  },
                 
                )
              )
            ],
          ),

          Selector<CardModel,  (Set<SeasonType>,bool)>(
            selector: (_, cardModel) => (cardModel.cardDetails.seasonTypeSet,cardModel.cardDetails.isMixed),
            builder: (_, seasonState, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    spacing: 12,
                    children: List.generate(SeasonType.values.length-1, (index) {
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)
                          ),
                          child: ToggleButton(
                            style: ToggleButtonThemeData(
                              checkedButtonStyle: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(SeasonType.values[index + 1].color),

                                elevation: WidgetStatePropertyAll(1.5),

                              ),
                              uncheckedButtonStyle: ButtonStyle(
                                backgroundColor: WidgetStateProperty.fromMap({
                                  WidgetState.disabled: FluentTheme.of(context).inactiveBackgroundColor
                                }),
                                elevation: WidgetStateProperty.all(1.5),

                              ),

                            ),
                            checked: seasonState.$1.contains(SeasonType.values[index + 1]),
                            onChanged: 
                            (
                            seasonState.$2 == false &&
                              seasonState.$1.isNotEmpty &&
                              seasonState.$1.first != SeasonType.values[index + 1]

                            ) ? 
                              null : 
                              (value) {

                                if (seasonState.$1.contains(SeasonType.values[index + 1])) {
                                  cardModel.updateSeasonType(seasonState.$1.copyWithRemove(element: SeasonType.values[index + 1]).toSet());
                                }

                                else {
                                  cardModel.updateSeasonType(seasonState.$1.copyWithAdd(SeasonType.values[index + 1]).toSet());

                                }

                              }
                            ,

                            child: Row(
                              children: [
                                Image.asset(
                                  convertElementTypeImageUrl(seasonType: SeasonType.values[index + 1]),
                                  scale: 2.5,
                                )
                              ],
                            ),
                          ),
                        );
                      }),

                  ),

                  Column(
                    spacing: 3,
                    children: [

                      ToggleSwitch(
                        checked: seasonState.$2,
                        onChanged: (_) {
                          cardModel.updateMixedType(!seasonState.$2);
                          if (seasonState.$1.length > 1) {
                            cardModel.updateSeasonType({seasonState.$1.first});
                          }
                        }
                      ),

                      Image.asset(convertElementTypeImageUrl(seasonType: SeasonType.wild), scale: 2.5)

                    ],
                  )

                ],
              );
            },
          ),

          Selector<CardModel, CardRarity>(
            selector: (_, cardModel) => cardModel.cardDetails.cardRarity,
            builder: (_, rarityType, child) {

              t.appTitle;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(t.cardPropPanel.basicProp.cardRarity.name),

                  DropDownButton(
                    title: Text(rarityType.text),
                    items: List.generate(
                      CardRarity.values.length,
                      (index) => MenuFlyoutItem(
                        text: Text(CardRarity.values[index].text),
                        onPressed: () => cardModel.updateRarity(CardRarity.values[index]),
                      )
                    ),
                  )

                ]
              );
            }

          )
        ],
      ),
    );
  }

}
