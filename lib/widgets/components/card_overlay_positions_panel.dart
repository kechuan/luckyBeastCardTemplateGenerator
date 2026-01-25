import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';
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
      header: Text("元素方位调整"),
      content: Column(
        spacing: 12,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Text("调整元素"),

              ValueListenableBuilder(
                valueListenable: positionTypeNotifer,
                builder: (_, positionType, _) {
                  return DropDownButton(
                    title: Text(positionType.name),
                    items: List.generate(
                      CardElementPositionType.values.length,
                      (index) => MenuFlyoutItem(
                        text: Text(CardElementPositionType.values[index].name),
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
              final originElementPositions = cardModel.cardElementPositions[positionTypeNotifer.value] ?? ElementPositions();

              double currentElementPositionsX = originElementPositions.relativePosition.dx;
              double currentElementPositionsY = originElementPositions.relativePosition.dy;
              double currentElementPositionsSize = originElementPositions.relativeSize;

              return Column(
                spacing: 12,
                children: [

                  ...List.generate(
                    3,
                    (index) {


                      return Selector<CardModel, ElementPositions>(
                        selector: (_, cardModel){
                           return cardModel.cardElementPositions[positionTypeNotifer.value] ?? ElementPositions();
                        },
                        builder: (_, cardElementPositions, _) {
                          return Row(
                            spacing: 12,
                            children: [
                              SizedBox(
                                width: 35,
                                child: Text(
                                  switch(index){
                                    0 => "X:",
                                    1 => "Y:",
                                    2 => "Size:",
                                    _ => ""
                                  },

                                )
                              ),
                              Flexible(
                                child: Slider(
                                  min: -1,
                                  max: 1,
                                  value: switch(index){
                                    0 => cardElementPositions.relativePosition.dx,
                                    1 => cardElementPositions.relativePosition.dy,
                                    2 => cardElementPositions.relativeSize,
                                    _ => 0
                                  },

                                  onChanged: (value) {

                                    switch (index){
                                      case 0:currentElementPositionsX = value;
                                      case 1:currentElementPositionsY = value;
                                      case 2:currentElementPositionsSize = value;
                                    }

                                    final offsetElementPositions = ElementPositions(
                                      relativePosition: Offset(currentElementPositionsX, currentElementPositionsY),
                                      relativeSize: currentElementPositionsSize
                                    );

                                    cardModel.updateCardElementPositions = {
                                      ...(cardModel.cardElementPositions),
                                      positionTypeNotifer.value : offsetElementPositions
                                    };

                                  },
                                ),
                              ),

                              switch(index){
                                 0 => Text(cardElementPositions.relativePosition.dx.toStringAsFixed(2)),
                                 1 => Text(cardElementPositions.relativePosition.dy.toStringAsFixed(2)),
                                 2 => Text(cardElementPositions.relativeSize.toStringAsFixed(2)),
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
                        Text("重置当前元素位置"),
                      ],
                    ),
                    onPressed: () {

                      currentElementPositionsX = 0;
                      currentElementPositionsY = 0;
                      currentElementPositionsSize = 0;

                      cardModel.updateCardElementPositions = {
                        ...(cardModel.cardElementPositions),
                        positionTypeNotifer.value : ElementPositions()
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
