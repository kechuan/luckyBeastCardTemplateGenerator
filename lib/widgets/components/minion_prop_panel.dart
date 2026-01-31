import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/internal/mdi_extension_icons.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/minion_tag_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/general_number_input_box.dart';
import 'package:provider/provider.dart';

class FluentCardMinionTypeProp extends StatefulWidget {
  const FluentCardMinionTypeProp({super.key});

  @override
  State<FluentCardMinionTypeProp> createState() => _FluentCardMinionTypePropState();
}

class _FluentCardMinionTypePropState extends State<FluentCardMinionTypeProp> {

  late TextEditingController attackTextEditingControllers;	
  late TextEditingController healthTextEditingControllers;

  @override
  void initState() {

    if (mounted) {
      final cardModel = context.read<CardModel>();

      healthTextEditingControllers = TextEditingController(text: '${cardModel.cardDetails.health ?? 0}');
      attackTextEditingControllers = TextEditingController(text: '${cardModel.cardDetails.attack ?? 0}');
    }

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [

        Divider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 12,
          children: [
            //Icon(Icons.room_service),
            Icon(MdiExtensionIcons.broadsword),
            ValueListenableBuilder(
              valueListenable: attackTextEditingControllers,
              builder: (_, attackText, child) {
                return Flexible(
                  child: Slider(
                    min: 0,
                    max: 20,
                    value: (double.tryParse(attackText.text) ?? 0).clamp(0, 20),
                    onChanged: (value) {
                      attackTextEditingControllers.text = value.round().toStringAsFixed(0);
                      context.read<CardModel>().updateAttack(value.round());
                      
                    }
                  )
                );
              }
            ),
            GeneralNumberInputBox(
              textEditingController: attackTextEditingControllers,
              onChanged: (value) {
                context.read<CardModel>().updateAttack(int.tryParse(attackTextEditingControllers.text) ?? 0);
              }
              
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 12,
          children: [
            //Icon(Icons.room_service),
            Icon(MdiExtensionIcons.heart),
            ValueListenableBuilder(
              valueListenable: healthTextEditingControllers,
              builder: (_, healthText, child) {
                return Flexible(
                  child: Slider(
                    min: 0,
                    max: 20,
                    value: (double.tryParse(healthText.text) ?? 0).clamp(0, 20),
                    onChanged: (value) {
                      healthTextEditingControllers.text = value.round().toStringAsFixed(0);
                      context.read<CardModel>().updateHealth(value.round());
                    }
                  )
                );
              }
            ),
            GeneralNumberInputBox(
              textEditingController: healthTextEditingControllers,
              onChanged: (value) {
                context.read<CardModel>().updateHealth(int.tryParse(healthTextEditingControllers.text) ?? 0);
              }
            )
          ],
        ),

        const MinionTagTypePanel(),


      ],
    );

  }
}
