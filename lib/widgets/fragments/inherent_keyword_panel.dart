import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:provider/provider.dart';


class InherentKeywordPanel extends StatefulWidget {
  const InherentKeywordPanel({super.key});

  @override
  State<InherentKeywordPanel> createState() => _InherentKeywordPanelState();
}

class _InherentKeywordPanelState extends State<InherentKeywordPanel> {

  final hoverIndexNotifier = ValueNotifier<int?>(null);
  final tagInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12)
      ),

      child: Column(
        spacing: 12,
        children: [

          Expanded(
            child: ListView(
              children: [

                Selector<CardModel, List<String>>(
                  selector: (_, cardModel) => cardModel.cardDetails.inherentTags,
                  builder: (_, inherentTags, _) {
                    return Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: List.generate(
                        inherentTags.length,
                        (index) {

                          return MouseRegion(
                            onEnter: (_) => hoverIndexNotifier.value = index,
                            onExit: (_) => hoverIndexNotifier.value = null,
                            child: Card(borderRadius: BorderRadiusGeometry.circular(16),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(inherentTags.elementAtOrNull(index) ?? ''),

                                  ValueListenableBuilder(
                                    valueListenable: hoverIndexNotifier,
                                    builder: (_, hoverIndex, child) {

                                      if(hoverIndex == index){
                                        return Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: GestureDetector(
                                            onTap: () {
                                              removeTab(index);
                                            },
                                            child: Icon(FluentIcons.chrome_close, size: 12),
                                          ),
                                        );
                                      }

                                      return const SizedBox.shrink();
                                      
                                    }
                                  ),

                                ],
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

          buildInputRow(),

        ],
      ),
    );
  }

  Widget buildInputRow() {
    
    return Row(
      children: [
        Expanded(
          child: TextBox(
            controller: tagInputController,
            placeholder: '悬浮对应标签以删除',
            onSubmitted: (value) {
              addTab(tagInputController.text);
              tagInputController.clear();
            },
          ),
        ),
        SizedBox(width: 8),
        Button(
          child: Text('新建'),
          onPressed: () {
           addTab(tagInputController.text);
           tagInputController.clear();
          },
        ),
      ],
    );
  }

  void addTab(String text){
    final positionRegExp = RegExp(r'\d+:.*');

    final cardModel = context.read<CardModel>();
    final inherentTags = [...cardModel.cardDetails.inherentTags];

      if (text.contains(positionRegExp)) {
        final position = int.parse(text.split(':')[0]);
        final name = text.split(':')[1];

        if (position - 1 < inherentTags.length) {
          inherentTags.insert(position - 1, name);
          
        }

        else {
          inherentTags.add(name);
        }

          
      }

      else {
        inherentTags.add(text);
      }

      cardModel.updateInherentTags = [...inherentTags];

      
  }

  void removeTab(int index) {

    final cardModel = context.read<CardModel>();
    final inherentTags = [...cardModel.cardDetails.inherentTags];

    inherentTags.removeAt(index);

    cardModel.updateInherentTags = [...inherentTags];


  }

}
