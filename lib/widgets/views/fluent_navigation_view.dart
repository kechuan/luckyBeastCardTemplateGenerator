import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/providers/navigation_panel_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/views/fluent_nav_split_view.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

class FluentLuckyBeastsTemplateNavigationView extends StatelessWidget {
  const FluentLuckyBeastsTemplateNavigationView({super.key});

  @override
  Widget build(BuildContext context) {

    return Selector<NavigationPanelModel, int>(
      selector: (_, navigationPanelModel) => navigationPanelModel.currentItemIndex,
      builder: (_, currentItemIndex, child) {
        return NavigationView(

          transitionBuilder: (child, animation) => child,
          appBar: NavigationAppBar(
            leading: Image.asset('assets/logo.png', scale: 2.5),
            title: Container(
              color: Colors.transparent,
              child: Center(child: Text(t.appTitle, style: TextStyle(fontSize: 13))),
            ),
            actions: const WindowCaption(),
          ),

          pane: NavigationPane(
            selected: currentItemIndex,
            onChanged: (index) => context.read<NavigationPanelModel>().setCurrentItemIndex(index),
            displayMode: PaneDisplayMode.compact,
            header: Builder(
              builder: (context) {
                return IconButton(
                  icon: const WindowsIcon(WindowsIcons.global_nav_button),
                  onPressed: () {
                    NavigationView.of(context).toggleCompactOpenMode();
                  }
                );
              }
            ),
            items: [

              //  PaneItem(
              //    icon: const WindowsIcon(WindowsIcons.global_nav_button),
              //    title: const Text('Nav'),
              //    //body: const Text("is a wall"),
              //  ),

              //类似Divider的玩意
              PaneItemSeparator(),

              ...NavItem.values.map((currentNavItem) {
                  return PaneItem(
                    icon: WindowsIcon(currentNavItem.icon),
                    title: switch (currentNavItem){
                      NavItem.picture => Text(currentNavItem.name),
                      NavItem.palette => Text(currentNavItem.name),
                    },

                    body: MainThreeColumnBody(
                      currentItem: currentNavItem,
                    ),
                  );
                }),

            ],
            footerItems: [
              PaneItemSeparator(),
              PaneItem(
                icon: const WindowsIcon(WindowsIcons.settings),
                title: const Text('Settings'),
                body: const Text("is a wall"),
              ),
              PaneItemAction(
                icon: const WindowsIcon(WindowsIcons.add),
                title: const Text('Add New Item'),
                onTap: () {
                  // Logic to add new items
                },
              ),
            ],
          ),

        );
      },

    );
  }
}
