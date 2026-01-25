import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/card_scalable_text.dart';
import 'package:provider/provider.dart';

class CardRenderElement extends StatelessWidget {
  const CardRenderElement({
    super.key,
    required this.elementPositionType,
    required this.readjustElementPosition,
    required this.containerSize,
    required this.isTextElement, 
    
  });

  final Size containerSize;
  final bool isTextElement;

  final CardElementPositionType elementPositionType;
  final ElementPositions readjustElementPosition;

  @override
  Widget build(BuildContext context) {

    final cardModel = context.read<CardModel>();

    final combineElementPosition = 
      elementPositionType.elementPositions +
        ( cardModel.cardElementPositions[elementPositionType] ?? ElementPositions())
    ;

    debugPrint("[${elementPositionType.name}] Offset: (${combineElementPosition.relativePosition.dx.toStringAsFixed(3)},${combineElementPosition.relativePosition.dy.toStringAsFixed(3)})");

    final absPos = combineElementPosition.getAbsolutePosition(containerSize);
    final absSize = combineElementPosition.getAbsoluteSize(containerSize);

    return Positioned(
      left: absPos.dx,
      top: absPos.dy,
      child: 
        //elementPositionType.isTextElement() ? 
        //renderElement(elementPositionType,containerSize) :
        SizedBox(
          width: max(0,absSize),
          height: max(0,absSize),
          child: renderElement(elementPositionType,containerSize),
        )
        
    );
  }
}


// 渲染具体元素
Widget renderElement(
  CardElementPositionType elementPositionType,
  Size containerSize
) {
  return Consumer<CardModel>(
    builder: (_, cardModel, _) {

      String renderText = switch (elementPositionType) {
        CardElementPositionType.name => "${cardModel.cardDetails.name}",
        CardElementPositionType.cost => "${cardModel.cardDetails.cost}",
        CardElementPositionType.attack => "${cardModel.cardDetails.attack}",
        CardElementPositionType.health => "${cardModel.cardDetails.health}",
        CardElementPositionType.typeTag => cardModel.cardDetails.inherentTags.join('/'),
        CardElementPositionType.inherentTag => cardModel.cardDetails.inherentTags.join('/'),
        CardElementPositionType.description => "${cardModel.cardDetails.description}",
        _ => ""
      };

      

      return switch (elementPositionType) {

        CardElementPositionType.cost ||
        CardElementPositionType.attack || 
        CardElementPositionType.health 
        => CardScalableText(
          text: renderText,
          boxSize: (
          elementPositionType.elementPositions + 
            (cardModel.cardElementPositions[elementPositionType] ?? ElementPositions())
          ).getAbsoluteSize(containerSize),
          strokeWidth: 3.5,
        ),

        CardElementPositionType.name ||
        CardElementPositionType.description ||
        CardElementPositionType.typeTag ||
        CardElementPositionType.inherentTag => CardScalableText(
          fontSize: 24,
          text: renderText,
          boxSize: (
          elementPositionType.elementPositions + 
            (cardModel.cardElementPositions[elementPositionType] ?? ElementPositions())
          ).getAbsoluteSize(containerSize),
          strokeWidth: 1.5,
        ),



        CardElementPositionType.seasonRequirement => const Text('SeasonRequirement'),

        CardElementPositionType.gem => const Text('Gem'),

        CardElementPositionType.image => Image.asset(
          'assets/custom_card_template/doll.jpg',
          fit: BoxFit.cover, // 填充指定区域
        ),

      };

    },
  );
}