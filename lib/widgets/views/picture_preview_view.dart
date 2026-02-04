import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_content.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/keyword_description.dart';
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

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [

            Container(
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
              child: CardContent(cardContainerSize: displaySize),
            ),

            Selector<CardModel, bool>(
              selector: (_, cardModel) => cardModel.isDescriptionExpanded,
              builder: (_, isDescriptionExpanded, _) {
                if(!isDescriptionExpanded) return const SizedBox.shrink();
                
                return Selector<CardModel, Map<String, String>>(
                  selector: (_, cardModel) => cardModel.keyWordDescriptions,
                  builder: (_, keyWordDescriptions, _) {
                    return Column(
                      spacing: 6,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        keyWordDescriptions.length,
                        (index) {

                          if (keyWordDescriptions.values.elementAtOrNull(index)?.isEmpty == true) {
                            return const SizedBox.shrink();
                          }

                          return KeyWordDescription(
                            keyWord: '${keyWordDescriptions.keys.elementAtOrNull(index)}',
                            descrpition: "${keyWordDescriptions.values.elementAtOrNull(index)}",
                          );
                        }
                      ),
                    );
                  }
                );
              }
            )
          ],
        );
      },
    );
  }
}

