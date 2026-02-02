import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:provider/provider.dart';

class DescriptionKeywordPanel extends StatefulWidget {
  const DescriptionKeywordPanel({super.key});

  @override
  State<DescriptionKeywordPanel> createState() => _DescriptionKeywordPanelState();
}

class _DescriptionKeywordPanelState extends State<DescriptionKeywordPanel> {

  final keyWordDescriptionController = TextEditingController();

  ValueNotifier<String?> keyWordDescriptionNotifier = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Expander(
      header: Text(t.cardPropPanel.cardDetail.keyWordDescription.name),
      content: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(t.cardPropPanel.cardDetail.keyWordDescription.displayKeyWordDescription),
              Selector<CardModel, bool>(
                selector: (_, cardModel) => cardModel.isDescriptionExpanded,
                builder: (_, status, _) {
                  return ToggleSwitch(
                    checked: status,
                    onChanged: (value) {
                      context.read<CardModel>().updateDescriptionExpandedMode = value;
                    }
                  );
                }
              )
            ],
          ),

          Selector<CardModel, bool>(
            selector: (_, cardModel) => cardModel.isDescriptionExpanded,
            builder: (_, status, _) {
              if (!status) return const SizedBox.shrink();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12,
                children: [

                  Selector<CardModel, Map<String, String>>(
                    selector: (_, cardModel) => cardModel.keyWordDescriptions,
                    shouldRebuild: (previous, next) => true,
                    builder: (_, keyWordDescriptions, _) {
                      return ValueListenableBuilder(
                        valueListenable: keyWordDescriptionNotifier,
                        builder: (_, currentSelectedKeyWord, _) {
                          return Wrap(
                            spacing: 12,
                            runSpacing: 6,
                            children: List.generate(
                              keyWordDescriptions.length,
                              (index){
                                return HoverButton(
                                  builder: (context, states) {
                                    return Button(
                                      onPressed: (){
                                        if(keyWordDescriptionNotifier.value == keyWordDescriptions.keys.elementAt(index)){
                                          keyWordDescriptionNotifier.value = null;
                                        }

                                        else{
                                          keyWordDescriptionNotifier.value = keyWordDescriptions.keys.elementAt(index);
                                          keyWordDescriptionController.text = keyWordDescriptions[keyWordDescriptions.keys.elementAt(index)] ?? "";
                                        }
                                        
                                      },
                                      style: ButtonStyle(
                                        elevation: WidgetStatePropertyAll(0),
                                        backgroundColor: WidgetStateColor.resolveWith(
                                          (states) {
                                            if (states.isPressed) return FluentTheme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.4);
                                        
                                            if (currentSelectedKeyWord == keyWordDescriptions.keys.elementAt(index)){
                                              return FluentTheme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.8);
                                            }
                                        
                                            else{
                                        
                                              if(
                                                keyWordDescriptions[keyWordDescriptions.keys.elementAt(index)] != null &&
                                                keyWordDescriptions[keyWordDescriptions.keys.elementAt(index)]!.isNotEmpty
                                              ){
                                                return FluentTheme.of(context).resources.cardBackgroundFillColorDefault;
                                              }
                                        
                                              return Colors.grey.withValues(alpha: 0.3);
                                              
                                            }
                                            
                                          
                                            
                                          }
                                        ),
                                    
                                    
                                        shape:WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadiusGeometry.circular(6)
                                          )
                                        
                                        )
                                        
                                        
                                      ),
                                      
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        spacing: 6,
                                        children: [
                                          if(currentSelectedKeyWord == keyWordDescriptions.keys.elementAt(index)) Icon(FluentIcons.accept),
                                          Text(keyWordDescriptions.keys.elementAt(index)),
                                        ],
                                      ),
                                    );
                                  },
                                  
                                  
                                );
                              }
                            ),
                          );
                        }
                      );
                    }
                  ),

                  TextBox(
                    controller: keyWordDescriptionController,
                    //onChanged: (value) {

                    //  final cardModel = context.read<CardModel>();

                    //  cardModel.keyWordDescriptions[keyWordDescriptionNotifier.value!] = value;
                    //  cardModel.updateKeyWordDescription = cardModel.keyWordDescriptions;

                    //},
                    onChanged: (value) {

                      final cardModel = context.read<CardModel>();

                      final newMap = Map<String, String>.from(cardModel.keyWordDescriptions);
                      newMap[keyWordDescriptionNotifier.value!] = value;

                      
                      cardModel.updateKeyWordDescription = newMap;

                    },
                    placeholder: t.cardPropPanel.cardDetail.keyWordDescription.placeHolder,
                  )
                ],
              );

            }
          )
          
          
        ],
      )
    );
  }
}
