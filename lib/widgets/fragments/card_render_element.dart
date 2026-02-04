import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/scalable_element.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/season_element.dart';
import 'package:provider/provider.dart';

class CardRenderElement extends StatelessWidget {
  const CardRenderElement({
    super.key,
    required this.elementPositionType,
    required this.cardContainerSize,
    this.exportMode = false
  });

  final Size cardContainerSize;

  final CardElementPositionType elementPositionType;

  final bool exportMode;

  @override
  Widget build(BuildContext context) {

    // 从配置中获取设计稿定义
    final designRect = 
      exportMode && elementPositionType == CardElementPositionType.gem ?
      ElementPositionConfigs.getLayout(elementPositionType)!.copyWith(x: 402.3) :
      ElementPositionConfigs.getLayout(elementPositionType)
    ;


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

    return Selector<CardModel, ElementPosition?>(
      selector: (_, model) => model.cardElementPosition[elementPositionType],
      builder: (_, readjustElementPosition, _) {

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
            readjustElementPosition?.relativeSize ?? 0,
          ),
        );
      }
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
  double readjustScale, 
) {

  //整个Model 就 Map 与 CardDetails 不值得再去拆分。。。
  return Selector<CardModel, String>(
    selector: (_, cardModel) {
      final cardDetails = cardModel.cardDetails;

      return switch (elementPositionType){
        CardElementPositionType.name =>  cardDetails.name ?? '',
        CardElementPositionType.cost =>  "${cardDetails.cost ?? '0'}",
        CardElementPositionType.attack =>  "${cardDetails.attack ?? '0'}",
        CardElementPositionType.health =>  "${cardDetails.health ?? '0'}",
        CardElementPositionType.typeTag =>  "${cardDetails.cardType.text}${cardDetails.familliarTags.isNotEmpty ? '\n' : ''}${cardDetails.familliarTags.join('/')}",
        CardElementPositionType.description => cardDetails.description ?? '',
        CardElementPositionType.gem => convertCardRarityTypeImageUrl(cardDetails.cardRarity),
        CardElementPositionType.image => File(cardDetails.imageUrl ?? '').existsSync() ? cardDetails.imageUrl! : '',
        _ => ''
      };
    },
    builder: (_, renderResource, _) {

      debugPrint("[$elementPositionType] it rebuild");

      String? textFontFamily;
      FontWeight? fontWeight;
      double designFontSize = 24;
      double? strokeWidth;

      AlignmentGeometry? stackTextAlign;

      switch (elementPositionType){

        case CardElementPositionType.name:{
          designFontSize = 28;
          strokeWidth = 3.8;
          textFontFamily = '黑体';
          fontWeight = FontWeight.w100;
        }

        case 
          CardElementPositionType.cost ||
          CardElementPositionType.attack ||
          CardElementPositionType.health :{
          designFontSize = 36;
        }

      
        case CardElementPositionType.typeTag:{

          designFontSize = 18;
          textFontFamily = '等线';
          fontWeight = FontWeight.w400;
          strokeWidth = 0;
          stackTextAlign = AlignmentDirectional.topCenter;

        }
        case CardElementPositionType.description:{

          designFontSize = 18;
          strokeWidth = 0;
          stackTextAlign = AlignmentDirectional.topStart;
          textFontFamily = '黑体';
        }

        default:{}
      }

      return Selector<AppModel, bool>(
        selector: (_, appModel) => appModel.displayReferenceLine,
        builder: (context, displayReferenceLine, switchChild) {
          return Container(
            decoration: BoxDecoration(
              border: 
              context.read<AppModel>().displayReferenceLine ?
                Border.all(color: const Color(0xFFFF0000)) :
                null
              ,
            ),
            child: switchChild!

          );
        },
        child: switch (elementPositionType) {

          CardElementPositionType.cost ||
          CardElementPositionType.attack || 
          CardElementPositionType.health ||
          CardElementPositionType.typeTag

          => 
          Center(
            child: ScalableFontSizeText(
              scaleRatio: scaleRatio,
              toggleScaleRatio: readjustScale,
              fontWeight: fontWeight,
              text: renderResource, 
              designFontSize: designFontSize,
              strokeWidth: strokeWidth,

              stackTextAlign: stackTextAlign,
              textFontFamily: textFontFamily,
            ),
          ),

          CardElementPositionType.name => 
          ScalableFontSizeText(
            scaleRatio: scaleRatio,
            toggleScaleRatio: readjustScale,
            text: renderResource,
            designFontSize: designFontSize,
            strokeWidth: strokeWidth,
            stackTextAlign: stackTextAlign,
            textFontFamily: textFontFamily,

          ),

          CardElementPositionType.description => Padding(
            padding: PaddingH12,
            child: ScalableFontSizeTextSpan(
              text: renderResource,
              designFontSize: designFontSize,
              scaleRatio: scaleRatio,
              toggleScaleRatio: readjustScale,
              textFontFamily: textFontFamily,
              
            ),
          ),

          CardElementPositionType.seasonRequirement => Transform.scale(
            scale: 1 + readjustScale,
            child: const SeasonElement()
          ),

          CardElementPositionType.gem => Transform.scale(
            scale: 1 + readjustScale,
            child: Image.asset(
              renderResource,
              fit: BoxFit.cover
            ),
          ),

          CardElementPositionType.maskLayer => Transform.scale(
            scale: 1 + readjustScale,
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.02),
                    Colors.black.withValues(alpha: 0.3),
                    Colors.black.withValues(alpha: 0.6),
                    Colors.black.withValues(alpha: 0.8),
            
                  ],
                  stops: [
                    0.2,
                    0.4,
                    0.7,
                    1
                  ]
                )
              ),
            ),
          ),

          CardElementPositionType.image => Transform.scale(
            scale: 1 + readjustScale,
            child: Builder(
              builder: (_) {

                if (renderResource.isEmpty) return const SizedBox.shrink();

                return Image.file(
                  File(renderResource),
                  fit: BoxFit.contain,
                );

              }
            ),
          ),
        });

    },
  );
}
