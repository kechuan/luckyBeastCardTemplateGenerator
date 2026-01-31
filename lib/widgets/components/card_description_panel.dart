
import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:provider/provider.dart';

class CardDescriptionPanel extends StatefulWidget {
  const CardDescriptionPanel({
    super.key
  });

  @override
  State<CardDescriptionPanel> createState() => _CardDescriptionPanelState();
}

class _CardDescriptionPanelState extends State<CardDescriptionPanel> {

  final descriptionTextEditingControllers = TextEditingController();

  @override
  void initState() {
    

    if(mounted){
      final cardModel = context.read<CardModel>();
      descriptionTextEditingControllers.addListener((){
        cardModel.updateDescription(descriptionTextEditingControllers.text);
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 6,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.cardPropPanel.cardDetail.cardDescription),

        SizedBox(
          height: 100,
          child: TextBox(
            controller: descriptionTextEditingControllers,
            maxLines: null,
            placeholder: t.cardPropPanel.cardDetail.cardDescriptionPlaceHolder,
          ),
        ),

      ],
    );

  }
}

TextSpan parseMarkedText(String inputText, {TextStyle? highlightStyle}) {
  final List<InlineSpan> spans = [];

  //捕获 {} 内的所有字符 另外的东西视作matchGroup(0)
  final RegExp regex = RegExp(r'\{([^}]+)\}');

  int textOffset = 0;

  for (final RegExpMatch match in regex.allMatches(inputText)) {
    if (match.start > textOffset) {
      spans.add(
        TextSpan(
          text: inputText.substring(textOffset, match.start)
        )
      );
    }

    spans.add(
      TextSpan(
        text: match.group(1),
        style: highlightStyle ?? TextStyle(color: Color.fromARGB(255,255,246,197)),
      )
    );

    textOffset = match.end;
  }

  if (textOffset < inputText.length) {
    spans.add(
      TextSpan(
        text: inputText.substring(textOffset)
      )
    );
  }

  return TextSpan(children: spans);
}


