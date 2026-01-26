import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/card_render_element.dart';
import 'package:provider/provider.dart';

class PicturePreviewView extends StatefulWidget {
  const PicturePreviewView({super.key});

  @override
  State<PicturePreviewView> createState() => _PicturePreviewViewState();
}

class _PicturePreviewViewState extends State<PicturePreviewView> {
  // 固定的设计尺寸 (基准尺寸)
  static const Size designSize = Size(500, 700);

  final GlobalKey boundaryKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // 计算合适的显示尺寸 (保持宽高比)
        final aspectRatio = designSize.width / designSize.height;

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
            child: RepaintBoundary(
              key: boundaryKey,
              child: CardContent(
                cardContainerSize: displaySize,
              ),
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
      selector: (_, cardModel) => cardModel.cardDetails.cardType == CardType.minion,
      builder: (_, isMinion, _) {

        return Stack(
          children: [
            // 背景层
            Selector<CardModel,  (Set<SeasonType>, CardType)>(
              selector: (_, model) => (
              model.cardDetails.seasonTypeSet, 
              model.cardDetails.cardType
              ),
              builder: (_, data, _) {
                return Positioned.fill(
                  child: Image.asset(
                    convertCardTypeImageUrl(
                      seasonTypeSet: data.$1, 
                      cardType: data.$2
                    ),
                    fit: BoxFit.fill, // 确保填充整个区域
                  ),
                );
              }
            ),

            ...cardModel.cardElementPosition.keys.map((elementType) {
            //...ElementPositionConfigs.layouts.keys.map((elementType) {

                if (!isMinion) {
                  if ([
                    CardElementPositionType.attack,
                    CardElementPositionType.health,
                    CardElementPositionType.typeTag
                  ].contains(elementType)) {
                    return const SizedBox.shrink();
                  }
                }

                return Selector<CardModel, ElementPosition?>(
                  selector: (_, model) => model.cardElementPosition[elementType],
                  builder: (_, readjustElementPosition, _) {


                    return CardRenderElement(
                      cardContainerSize: widget.cardContainerSize,
                      readjustElementPosition: readjustElementPosition,
                      elementPositionType: elementType,
                      //isTextElement: element.isTextElement(),
                    );
                  }
                );

              }),

            // 调试信息
            Positioned(
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
          ],
        );
      }
    );
  }




}
