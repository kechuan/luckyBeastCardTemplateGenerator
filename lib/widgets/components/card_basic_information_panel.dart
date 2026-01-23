import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
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
      header: Text("基础属性: name 稀有度 季语类别(混合?) "),
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
                  onEditingComplete: () {
                    cardModel.updateName = cardNameController.text;
                  },
                )
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                spacing: 12,
                children: List.generate(4, (index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: ToggleButton(

                        style: ToggleButtonThemeData(
                          checkedButtonStyle: ButtonStyle(
                            elevation: WidgetStatePropertyAll(1.5),

                            //backgroundColor: WidgetStatePropertyAll(),

                          )
                        ),
                        checked: true,
                        onChanged: (_) {},
                        child: Row(
                          children: [
                            Image.asset(
                              convertCardTypeImageUrl(SeasonType.values[index + 1]),
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
                    checked: false,
                    onChanged: (_) {}
                  ),

                  Image.asset(convertCardTypeImageUrl(SeasonType.wild),scale: 2.5)

                ],
              )

            ],
          )

        ],
      ),
    );
  }
}
