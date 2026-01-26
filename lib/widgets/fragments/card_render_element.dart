import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/forigen_text_handle.dart';
import 'package:provider/provider.dart';

class CardRenderElement extends StatelessWidget {
  const CardRenderElement({
    super.key,
    required this.elementPositionType,
    required this.cardContainerSize,
    this.readjustElementPosition,

    //this.elementSize,

    //required this.isTextElement,

  });

  final Size cardContainerSize;

  final CardElementPositionType elementPositionType;
  final ElementPosition? readjustElementPosition;

  //  final Size? elementSize;
  //  final bool isTextElement;

  @override
  Widget build(BuildContext context) {
    // 从配置中获取设计稿定义
    final designRect = ElementPositionConfigs.getLayout(elementPositionType);

    if (designRect == null) {
      debugPrint('Warning: No layout defined for $elementPositionType');
      return const SizedBox.shrink();
    }

    // 计算缩放后的位置和大小
    final scaledPosition = designRect.getScaledPosition(
      kCardDesignSize, 
      cardContainerSize,
    );
    final scaledSize = designRect.getScaledSize(
      kCardDesignSize, 
      cardContainerSize,
    );

    // 应用微调偏移
    final finalPosition = scaledPosition + (
      readjustElementPosition?.relativePosition ?? Offset.zero
      );

    debugPrint(
      '[${elementPositionType.name}] '
      'x:${designRect.x} => ${finalPosition.dx.toStringAsFixed(1)},'
      'y:${designRect.y} => ${finalPosition.dy.toStringAsFixed(1)},'
      'width:${designRect.width} => ${scaledSize.width.toStringAsFixed(1)},'
      'height:${designRect.height} => ${scaledSize.height.toStringAsFixed(1)},'
      'size Ratio.w:${(scaledSize.width / designRect.width).toStringAsFixed(2)},'
      'size Ratio.h:${(scaledSize.height / designRect.height).toStringAsFixed(2)}'

    //  'Scaled: ${finalPosition.dx.toStringAsFixed(1)},${finalPosition.dy.toStringAsFixed(1)} '
    //  '${scaledSize.width.toStringAsFixed(1)}x${scaledSize.height.toStringAsFixed(1)}'
    );

    return Positioned(
      left: finalPosition.dx,
      top: finalPosition.dy,
      width: scaledSize.width,
      height: scaledSize.height,
      child: renderElement(
        elementPositionType,
        cardContainerSize,
        scaledSize,
        scaledSize.height / designRect.height,
      ),
    );
  }

}



/// 渲染具体元素
/// 注意Stack的排列顺序
Widget renderElement(
  CardElementPositionType elementPositionType,
  Size cardContainerSize,
  Size elementLayoutSize,
  double scaleRatio,
) {
  return DecoratedBox(
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFFF0000)),
    ),
    child: Consumer<CardModel>(
      builder: (_, cardModel, _) {

        String renderText = "";
        double designFontSize = 24;
        double? strokeWidth;

        switch (elementPositionType){

          case CardElementPositionType.name:{
            renderText = "${cardModel.cardDetails.name}";
            strokeWidth = 4;

          }
          case CardElementPositionType.cost:{
            renderText = "${cardModel.cardDetails.cost}";
            designFontSize = 36;
          }

          case CardElementPositionType.attack:{
            renderText = "${cardModel.cardDetails.attack}";
            designFontSize = 36;
          }
          case CardElementPositionType.health:{
            renderText = "${cardModel.cardDetails.health}";
            designFontSize = 36;

            debugPrint("health Size:${elementLayoutSize * (1 + (cardModel.cardElementPosition[CardElementPositionType.health] ?? ElementPosition()).relativeSize)}");
          }
          case CardElementPositionType.inherentTag:{
            renderText = cardModel.cardDetails.inherentTags.join('/');
          }
          case CardElementPositionType.typeTag:{
            designFontSize = 12;
            renderText = 
            "${cardModel.cardDetails.inherentTags.join('/')}"
            "${cardModel.cardDetails.cardType.name}\n"
            ;
            strokeWidth = 0;
          }
          case CardElementPositionType.description:{
            renderText = "${cardModel.cardDetails.description}";
            designFontSize = 18;
            strokeWidth = 0;
          }

          default:{}
        }

        return switch (elementPositionType) {

          CardElementPositionType.cost ||
          CardElementPositionType.attack || 
          CardElementPositionType.health ||
          CardElementPositionType.typeTag ||
          CardElementPositionType.inherentTag
          => 
          AdaptiveFontSizeText(

            text: renderText, 

            designFontSize: designFontSize,
            strokeWidth: strokeWidth,
            boxSize: elementLayoutSize * (cardModel.cardElementPosition[elementPositionType] ?? ElementPosition()).relativeSize,
            scaleRatio: scaleRatio,
            //passiveScaleRatio: scaleRatio,
            //initiativeScaleRatio: cardModel.cardElementPosition[elementPositionType]?.relativeSize ?? 0,
          ),

          //CardScalableText(
          //  text: renderText,
          //  boxSize: (cardModel.cardElementPosition[elementPositionType] ?? ElementPosition()).getAbsoluteSize(cardContainerSize),
          //  strokeWidth: 3.5,
          //),

          CardElementPositionType.name ||
          CardElementPositionType.description
          => 

          AdaptiveFontSizeText(
            scaleRatio: scaleRatio,
            text: renderText,
            //initiativeScaleRatio: cardModel.cardElementPosition[elementPositionType]?.relativeSize ?? 0,
            boxSize: elementLayoutSize * (cardModel.cardElementPosition[elementPositionType] ?? ElementPosition()).relativeSize, 
            designFontSize: designFontSize,
            strokeWidth: strokeWidth,

          ),

          //  CardElementPositionType.seasonRequirement => const Text('SeasonRequirement'),

          CardElementPositionType.seasonRequirement => Transform.scale(
            scale: (cardModel.cardElementPosition[elementPositionType]?.relativeSize ?? 0) + 1,
            child: Row(
              
              children: List.generate(
                cardModel.cardDetails.seasonRequirement.length, 
                (index) {
            
                  if (cardModel.cardDetails.seasonRequirement.elementAt(index) > 0) {
            
                    if (cardModel.cardDetails.seasonRequirement.elementAt(index) >= 3) {
                      return Row(
                        spacing: 6,
                        children: [
                          Image.asset(
                            convertElementTypeImageUrl(seasonType: SeasonType.values.elementAt(index)),
                            fit: BoxFit.cover
                          ),
            
                          Text(
                            "${cardModel.cardDetails.seasonRequirement.elementAt(index)}",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    }
            
                    else {
                      return Row(
                        children: List.generate(
                          cardModel.cardDetails.seasonRequirement.elementAt(index),
                          (_) => Image.asset(
                            convertElementTypeImageUrl(seasonType: SeasonType.values.elementAt(index)),
                            fit: BoxFit.cover
                          )
                        ),
                      );
                    }
                  }
            
                  return const SizedBox.shrink();
            
                }
              ),
            ),
          ),

          CardElementPositionType.gem => Transform.scale(
            scale: (cardModel.cardElementPosition[elementPositionType]?.relativeSize ?? 0) + 1,
            child: Image.asset(
              convertCardRarityTypeImageUrl(cardModel.cardDetails.cardRarity),
              fit: BoxFit.cover
            ),
          ),

          CardElementPositionType.image => Transform.scale(
            scale: (cardModel.cardElementPosition[elementPositionType]?.relativeSize ?? 0) + 1,
            child: Image.asset(
              'assets/custom_card_template/doll.jpg',
              fit: BoxFit.cover
            ),
          ),

        };

      },
    ),
  );
}
