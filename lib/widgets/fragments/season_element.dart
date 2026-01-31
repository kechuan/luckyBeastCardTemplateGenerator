import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/internal/extensions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:provider/provider.dart';

class SeasonElement extends StatelessWidget {
  const SeasonElement({super.key});

  @override
  Widget build(BuildContext context) {
    final cardModel = context.read<CardModel>();

    return Selector<CardModel, num>(
        selector: (_, cardModel) => cardModel.cardDetails.seasonRequirement.count(),
        builder: (_, seasonRequirementLength, _) {
        return Row(
          children: List.generate(
            cardModel.cardDetails.seasonRequirement.length, 
            (index) {
        
              if (cardModel.cardDetails.seasonRequirement.elementAt(index) > 0) {
        
                if (
                  //单个超3
                  cardModel.cardDetails.seasonRequirement.elementAt(index) >= 3 && 
                  //且存在其余的季语加起来达到6个
                  seasonRequirementLength >= 6
                ) {
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
        );
      }
    );
  }
}
