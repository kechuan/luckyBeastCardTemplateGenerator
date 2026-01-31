
import 'dart:typed_data';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/catalogs/setting_page.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/fragments/fluent_dialog.dart';
import 'package:lucky_beast_card_template_generator/widgets/views/fluent_main_view.dart';
import 'package:lucky_beast_card_template_generator/widgets/views/picture_preview_view.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

class FluentLuckyBeastsTemplateNavigationView extends StatelessWidget {
  const FluentLuckyBeastsTemplateNavigationView({super.key});

  @override
  Widget build(BuildContext context) {

    return Selector<AppModel, int>(
      selector: (_, appModel) => appModel.currentItemIndex,
      builder: (_, currentItemIndex, mainWidget) {

        return NavigationView(

          transitionBuilder: (child, animation) => child,
          appBar: NavigationAppBar(
            leading: Image.asset('assets/logo.png', scale: 2.5),
            title: ColoredBox(
              color: Colors.transparent,
              child: Center(
                child: Text(t.appTitle, style: TextStyle(fontSize: 13))
              ),
            ),
            actions: WindowCaption(
              brightness: FluentTheme.of(context).brightness == Brightness.dark ? Brightness.dark : Brightness.light,
              backgroundColor: Colors.transparent,
              //title: Text("test"),
            ),
          ),

          pane: NavigationPane(
            selected: currentItemIndex,
            onChanged: (index) => context.read<AppModel>().updateCurrentItemIndex = index,
            displayMode: PaneDisplayMode.compact,
            items: [

              //类似Divider的玩意
              PaneItemSeparator(),

              PaneItem(
                icon: WindowsIcon(NavItem.palette.icon),
                title: switch (NavItem.palette){
                  NavItem.palette => Text(NavItem.palette.text),
                },

                body: mainWidget!,
              )

            ],
            footerItems: [
              PaneItemSeparator(),
              PaneItem(
                icon: const WindowsIcon(WindowsIcons.settings),
                title: Text(t.navigationPanel.setting),
                body: const SettingPage(),
              ),
              PaneItemAction(
                icon: const WindowsIcon(WindowsIcons.save),
                title: Text(t.navigationPanel.exportButton),
                onTap: () async {

                  final appModel = context.read<AppModel>();
                  final cardModel = context.read<CardModel>();

                  await showDialog<(Future<Uint8List>?, String)>(
                    context: context,
                    barrierDismissible: true,
                    builder: (_) => FluentDialog(
                      confirmAction: (size)  {

                        return captureInvisibleWidget(
                          widget: MultiProvider(
                            providers: [
                              ChangeNotifierProvider.value(value: appModel),
                              ChangeNotifierProvider.value(value: cardModel),
                            ],
                            child: SizedBox(
                              width: size?.width ?? kCardDesignSize.width,
                              height: size?.height ?? kCardDesignSize.height,
                              child: CardContent(cardContainerSize: size ?? kCardDesignSize)
                            ),
                          ),
                          size: size
                        );
                      },
                    )
                  ).then((data) async {
                    if (data != null) {
                      saveAsOnWindows(
                        data.$2,
                        bytes: await data.$1,
                        cardName: cardModel.cardDetails.name
                      );
                    }
                  });

                },
              ),
            ],
          ),

        );

      },

      child: const MainView(),

    );
  }
}
