import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/card_render_element.dart';
import 'package:provider/provider.dart';

class CardContent extends StatelessWidget {
  const CardContent({
    super.key,
    required this.cardContainerSize,
    this.exportMode = false
  });

  final Size cardContainerSize;
  final bool exportMode;

  @override
  Widget build(BuildContext context) {
    final cardModel = context.read<CardModel>();

    return Selector<CardModel, bool>(
      selector: (_, cardModel) => cardModel.cardDetails.cardType.isChess(),
      builder: (_, isChess, _) {

        return Stack(
          children: [
            // 背景层
            Selector<CardModel,  (Set<SeasonType>, CardType)>(
              selector: (_, model) => (
                model.cardDetails.seasonTypeSet, 
                model.cardDetails.cardType
              ),
              builder: (_, data, _) {

                final cardBackgroundPath = convertCardTypeImageUrl(
                  seasonTypeSet: data.$1, 
                  cardType: data.$2
                );

                if (cardBackgroundPath.isEmpty) {
                  return Center(
                    child: const Text("¯\\_(ツ)_/¯", style: TextStyle(fontSize: 24))
                  );
                }

                //一切元素的基准定位
                return Positioned.fill(
                  child: Image.asset(
                    cardBackgroundPath,
                    fit: BoxFit.fill,
                  ),
                );
              }
            ),

            //数据层
            ...cardModel.cardElementPosition.keys.map((elementType) {

                if (!isChess) {
                  if ([
                    CardElementPositionType.attack,
                    CardElementPositionType.health,
                  ].contains(elementType)) {
                    return const SizedBox.shrink();
                  }
                }

                return CardRenderElement(
                  cardContainerSize: cardContainerSize,
                  elementPositionType: elementType,
                  exportMode: exportMode
                );

              }),

            // 调试信息
            Selector<AppModel, bool>(
              selector: (_, appModel) => appModel.displayReferenceLine,
              builder: (_, displayReferenceLine, sizeInfoWidget) {
                if (!displayReferenceLine) {
                  return const SizedBox.shrink();
                }

                return sizeInfoWidget!;

              },
              child: Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${cardContainerSize.width.toInt()} x ${cardContainerSize.height.toInt()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
              ),
            ),

          ],
        );


      }
    );
  }
}
