import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/widgets/views/fluent_card_prop_view.dart';
import 'package:lucky_beast_card_template_generator/widgets/views/picture_preview_view.dart';


class MainView extends StatelessWidget {

  const MainView({
    super.key,
    this.currentItem = NavItem.palette,
  });

  final NavItem currentItem;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: 200,
                minHeight: 200
              ),
              child: const PicturePreviewView()
            )  
          ),
      
          
          SizedBox(
            width: 350,
            child: switch (currentItem) {
              NavItem.palette => const FluentCardPropView()
            }

          ),
        ],
      ),
    );
  }


}



