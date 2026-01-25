import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/internal/number_input_formatter.dart';

class GeneralNumberInputBox extends StatelessWidget {
  const GeneralNumberInputBox({
    super.key, 

    required this.textEditingController, 
    this.height,
    this.width,

    this.onChanged,
    this.onEditingComplete,
    

  });

  final double? height;
  final double? width;

  final Function(String)? onChanged;
  final Function()? onEditingComplete;

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 35,
      width: width ?? 35,
      child: TextFormBox(
        controller: textEditingController,
        inputFormatters: defaultInputFormatter,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
      ),
    );
  }
}
