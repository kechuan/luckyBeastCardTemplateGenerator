import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/card_render_element.dart';
import 'package:provider/provider.dart';

class PicturePreviewView extends StatelessWidget {
  const PicturePreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        // 计算合适的显示尺寸 (保持宽高比)
        final aspectRatio = kCardDesignSize.width / kCardDesignSize.height;

        double displayWidth = constraints.maxWidth * 0.8;
        double displayHeight = displayWidth / aspectRatio;

        if (displayHeight > constraints.maxHeight * 0.9) {
          displayHeight = constraints.maxHeight * 0.9;
          displayWidth = displayHeight * aspectRatio;
        }

        final displaySize = Size(displayWidth, displayHeight);

        return Center(
          child: Container(
            width: displayWidth,
            height: displayHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: SizedBox(
              width: kCardDesignSize.width,
              height: kCardDesignSize.height,
              child: CardContent(cardContainerSize: displaySize),
            ),
          ),
        );
      },
    );
  }
}

class CardContent extends StatefulWidget {
  const CardContent({
    super.key,
    required this.cardContainerSize
  });

  final Size cardContainerSize;

  @override
  State<CardContent> createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {

  @override
  Widget build(BuildContext context) {
    final cardModel = context.read<CardModel>();

    return Selector<CardModel, bool>(
      selector: (_, cardModel) => cardModel.cardDetails.cardType.isChess() ,
      builder: (_, isChess, _) {

        return Stack(
          children: [
            // 背景层
            Selector<CardModel, (Set<SeasonType>, CardType)>(
              selector: (_, model) => (
                model.cardDetails.seasonTypeSet, 
                model.cardDetails.cardType
              ),
              builder: (_, data, _) {
                return Positioned.fill(
                  child: Builder(
                    builder: (_) {

                      final cardBackgroundPath = convertCardTypeImageUrl(
                        seasonTypeSet: data.$1, 
                        cardType: data.$2
                      );

                      if(cardBackgroundPath.isEmpty){
                        return Center(
                          child: const Text("¯\\_(ツ)_/¯",style: TextStyle(fontSize: 24))
                        );
                      }

                      return Image.asset(
                        convertCardTypeImageUrl(
                          seasonTypeSet: data.$1, 
                          cardType: data.$2
                        ),
                        fit: BoxFit.fill,
                      );
                    }
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
                  cardContainerSize: widget.cardContainerSize,
                  elementPositionType: elementType,
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
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    '${widget.cardContainerSize.width.toInt()} x ${widget.cardContainerSize.height.toInt()}',
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
