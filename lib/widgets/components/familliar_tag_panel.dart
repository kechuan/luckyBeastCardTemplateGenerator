import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:provider/provider.dart';


class MinionTagTypePanel extends StatefulWidget {
  const MinionTagTypePanel({super.key});

  @override
  State<MinionTagTypePanel> createState() => _MinionTagTypePanelState();
}

class _MinionTagTypePanelState extends State<MinionTagTypePanel> {

  final hoverIndexNotifier = ValueNotifier<int?>(null);
  final tagInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.cardPropPanel.cardDetail.familliarTagSetting),

              Button(
                child: Text(t.cardPropPanel.cardDetail.newFamilliarTag),
                onPressed: () {
                  addTab(tagInputController.text);
                  tagInputController.clear();
                },
              ),
            ],
          ),

          Selector<CardModel, int>(
            selector: (_, cardModel) => cardModel.cardDetails.familliarTags.length,
            builder: (_, minionTypeLength, _) {
              return AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: SizedBox(
                  height: minionTypeLength > 0 ? 50 : 0,
                  child: ListView(
                    children: [

                      Selector<CardModel, List<String>>(
                        selector: (_, cardModel) => cardModel.cardDetails.familliarTags,
                        builder: (_, minionTags, _) {
                          return Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(
                              minionTags.length,
                              (index) {

                                return MouseRegion(
                                  onEnter: (_) => hoverIndexNotifier.value = index,
                                  onExit: (_) => hoverIndexNotifier.value = null,
                                  child: GestureDetector(
                                    onTap: () => removeTab(index),
                                    child: Card(
                                      borderRadius: BorderRadiusGeometry.circular(16),
                                      child: Text(minionTags.elementAtOrNull(index) ?? ''),

                                    ),
                                  ),
                                );
                              }

                            ),
                          );
                        }
                      ),

                    ],
                  ),
                ),
              );
            }
          ),


          SizedBox(
            height: 40,
            child: TextBox(
              controller: tagInputController,
              placeholder: t.cardPropPanel.cardDetail.familliarTagPlaceHolder,
              onSubmitted: (value) {
                addTab(tagInputController.text);
                tagInputController.clear();
              },
            )
          ),

        ],
      ),
    );
  }

  void addTab(String text) {
    final positionRegExp = RegExp(r'\d+:.*');

    final cardModel = context.read<CardModel>();
    final minionTags = [...cardModel.cardDetails.familliarTags];

    if (text.contains(positionRegExp)) {
      final position = int.parse(text.split(':')[0]);
      final name = text.split(':')[1];

      if (position - 1 < minionTags.length) {
        minionTags.insert(position - 1, name);

      }

      else {
        minionTags.add(name);
      }

    }

    else {
      minionTags.add(text);
    }

    cardModel.updateminionTags(minionTags);

  }

  void removeTab(int index) {

    final cardModel = context.read<CardModel>();
    final minionTags = [...cardModel.cardDetails.familliarTags];

    minionTags.removeAt(index);

    cardModel.updateminionTags(minionTags);

  }

}
