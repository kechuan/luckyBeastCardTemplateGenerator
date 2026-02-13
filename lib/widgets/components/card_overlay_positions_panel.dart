import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:provider/provider.dart';

class CardOverlayPositionsPanel extends StatefulWidget {
  const CardOverlayPositionsPanel({super.key});

  @override
  State<CardOverlayPositionsPanel> createState() => _CardOverlayPositionsPanelState();
}

class _CardOverlayPositionsPanelState extends State<CardOverlayPositionsPanel> {

  final positionTypeNotifer = ValueNotifier<CardElementPositionType>(CardElementPositionType.image);

  @override
  Widget build(BuildContext context) {

    return Expander(
      header: Text(t.cardPropPanel.elementPositions.name),
      content: Column(
        spacing: 12,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.cardPropPanel.elementPositions.displayReferenceLine),

              Selector<AppModel,bool>(
                selector: (_, appModel) => appModel.displayReferenceLine,
                builder: (_, displayReferenceLine, _){
                  return ToggleSwitch(
                    checked: displayReferenceLine,
                    onChanged: (value) {
                      context.read<AppModel>().updateDisplayReferenceLineMode = value;
                    }
                  );
                }, 
              )

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text(t.cardPropPanel.elementPositions.elementToggle),

              ValueListenableBuilder(
                valueListenable: positionTypeNotifer,
                builder: (_, positionType, _) {
                  return DropDownButton(
                    title: Text(positionType.text),
                    items: List.generate(
                      CardElementPositionType.values.length,
                      (index) => MenuFlyoutItem(
                        text: Text(CardElementPositionType.values[index].text),
                        onPressed: () => positionTypeNotifer.value = CardElementPositionType.values[index],
                      )
                    ),
                  );
                }
              ),

            ],
          ),

          ValueListenableBuilder(
            valueListenable: positionTypeNotifer,
            builder: (_, value, _) {

              final cardModel = context.read<CardModel>();
              final originElementPosition = cardModel.cardElementPosition[positionTypeNotifer.value] ?? ElementPosition();

              double currentElementPositionX = originElementPosition.relativePosition.dx;
              double currentElementPositionY = originElementPosition.relativePosition.dy;
              double currentElementPositionSize = originElementPosition.relativeSize;

              return Column(
                spacing: 12,
                children: [

                  ...List.generate(
                    3,
                    (index) {

                      return Selector<CardModel, ElementPosition>(
                        selector: (_, cardModel) {
                          return cardModel.cardElementPosition[positionTypeNotifer.value] ?? ElementPosition();
                        },
                        builder: (_, cardElementPosition, _) {
                          return Row(
                            spacing: 12,
                            children: [
                              SizedBox(
                                width: 35,
                                child: Text(
                                  switch (index){
                                    0 => "X:",
                                    1 => "Y:",
                                    2 => "Size:",
                                    _ => ""
                                  },

                                )
                              ),
                              Flexible(
                                child: Slider(
                                  min: switch(index){
                                    0 => -100,
                                    1 => -150,
                                    2 => -1,
                                    _ => 0
                                  },
                                  max: switch(index){
                                    0 => 100,
                                    1 => 150,
                                    2 => 1,
                                    _ => 0
                                  },
                                  value: switch (index){
                                    0 => cardElementPosition.relativePosition.dx,
                                    1 => cardElementPosition.relativePosition.dy,
                                    2 => cardElementPosition.relativeSize,
                                    _ => 0
                                  },

                                  onChanged: (value) {

                                    switch (index){
                                      case 0:currentElementPositionX = value;
                                      case 1:currentElementPositionY = value;
                                      case 2:currentElementPositionSize = value;
                                    }

                                    final offsetElementPosition = ElementPosition(
                                      relativePosition: Offset(currentElementPositionX, currentElementPositionY),
                                      relativeSize: currentElementPositionSize
                                    );

                                    cardModel.updateCardElementPosition = {
                                      ...(cardModel.cardElementPosition),
                                      positionTypeNotifer.value : offsetElementPosition
                                    };

                                  },
                                ),
                              ),

                              switch (index){
                                0 => Text(cardElementPosition.relativePosition.dx.toStringAsFixed(2)),
                                1 => Text(cardElementPosition.relativePosition.dy.toStringAsFixed(2)),
                                2 => Text(cardElementPosition.relativeSize.toStringAsFixed(2)),
                                _ => Text("")
                              }

                            ],
                          );
                        }
                      );
                    }
                  ),

                  Button(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 6,
                      children: [
                        Icon(FluentIcons.refresh),
                        Text(t.cardPropPanel.elementPositions.resetCurrentElement),
                      ],
                    ),
                    onPressed: () {

                      currentElementPositionX = 0;
                      currentElementPositionY = 0;
                      currentElementPositionSize = 0;

                      cardModel.updateCardElementPosition = {
                        ...(cardModel.cardElementPosition),
                        positionTypeNotifer.value : ElementPosition()
                      };

                    }
                  )
                ],
              );
            }
          )

        ],
      ),
    );
  }
}
