import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/general_number_input_box.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/inherent_keyword_panel.dart';
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

      healthTextEditingControllers = TextEditingController(text: cardModel.cardDetails.health.toString());
      attackTextEditingControllers = TextEditingController(text: cardModel.cardDetails.attack.toString());
    }

	super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      children: [

		Divider(),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 12,
          children: [
            //Icon(Icons.room_service),
            Icon(FluentIcons.align_center),
            ValueListenableBuilder(
			  valueListenable: attackTextEditingControllers,
			  builder: (_, attackText, child) {
				return Flexible(
					child: Slider(
						min: 0,
						max: 20,
						value: (double.tryParse(attackText.text) ?? 0).clamp(0, 20),
						onChanged: (value) {
							attackTextEditingControllers.text = value.toStringAsFixed(0);
						}
					)
				);
			  }
			),
            GeneralNumberInputBox(
              textEditingController: attackTextEditingControllers,
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 12,
          children: [
            //Icon(Icons.room_service),
            Icon(FluentIcons.align_center),
            ValueListenableBuilder(
			  valueListenable: healthTextEditingControllers,
			  builder: (_, healthText, child) {
				return Flexible(
					child: Slider(
						min: 0,
						max: 20,
						value: (double.tryParse(healthText.text) ?? 0).clamp(0, 20),
						onChanged: (value) {
							healthTextEditingControllers.text = value.toStringAsFixed(0);
						}
					)
				);
			  }
			),
            GeneralNumberInputBox(
              textEditingController: healthTextEditingControllers,
            )
          ],
        ),

        //信息 种族信息与卡片类型是绑在一起显示的 且类型永远在上方
        // 如果出现多个种族 则以 人类/神/巫女 捆绑显示

        //关键字的设置

        //文本溢出的设置。官方实际上并不会把文字写溢出的地步
        //但是二创难说 因此需要自适应大小的FittedBox	
        Text("种族Tag设置:"),

		SizedBox(
			height: 100,
			child: InherentKeywordPanel()
		)

      ],
    );

  }
}
