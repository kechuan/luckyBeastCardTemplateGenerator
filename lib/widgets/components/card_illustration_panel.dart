import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:provider/provider.dart';

class CardIllustrationPanel extends StatelessWidget {
  const CardIllustrationPanel({super.key});

  @override
  Widget build(BuildContext context) {

    final appModel = context.read<AppModel>();

    return Expander(
      initiallyExpanded: true,
      header: Row(
        spacing: 12,
        children: [
          Text(t.cardPropPanel.illustrationSelect.name),

          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.warningPrimaryColor,
              ),
              borderRadius: BorderRadius.circular(6),
            ),
            child: IconButton(
              icon: const Icon(FluentIcons.delete),
              style: ButtonStyle(
                foregroundColor: WidgetStatePropertyAll(Colors.red.withValues(alpha: 0.8)),
              ),
              onPressed: () {
                appModel.updateIllustrationPaths = {};
                context.read<CardModel>().updateImageUrl(null);
              },
            ),
          )
        ]
      ),
      //illustrationSelect
      content: Selector<AppModel, int>(
        selector: (_, appModel) => appModel.illustrationPaths.length,
        builder: (_, resourceLength, _) {
          return Center(
            child: AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: AnimatedCrossFade(
                firstChild: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      Text("¯\\_(ツ)_/¯", style: TextStyle(color: FluentTheme.of(context).inactiveColor)),
                      Text(t.cardPropPanel.illustrationSelect.emptyPromptPart, style: TextStyle(color: FluentTheme.of(context).inactiveColor)),
                    ],
                  ),
                ),
                secondChild: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: resourceLength,
                    itemExtent: 60,
                    itemBuilder: (_, index) {
                      return Selector<CardModel, String?>(
                        selector: (_, cardModel) => cardModel.cardDetails.imageUrl,
                        builder: (_, selectedImageUrl, _) {
                          return Padding(
                            padding: PaddingV6,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: 
                                selectedImageUrl == appModel.illustrationPaths.elementAt(index) ? 
                                  Colors.orange.withValues(alpha: 0.2) : 
                                  null
                                ,
                              ),

                              child: ListTile(

                                onPressed: () {
                                  final cardModel = context.read<CardModel>();
                                  cardModel.updateCardImageUrl(appModel.illustrationPaths.elementAt(index));
                                },
                                leading: 
                                selectedImageUrl == appModel.illustrationPaths.elementAt(index) ? 
                                  const Icon(FluentIcons.accept) :
                                  null
                                ,
                                title: Text(
                                  appModel.illustrationPaths.elementAt(index).split('\\').last.toLowerCase(),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          );
                        }
                      );
                    },
                  ),
                ),
                crossFadeState: resourceLength > 0 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),

              ),
            ),
          );
        }
      ),
    );
  }

}
