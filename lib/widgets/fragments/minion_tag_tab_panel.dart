import 'package:fluent_ui/fluent_ui.dart';
//import 'package:flutter/material.dart';

class MinionTagTabPanel extends StatefulWidget {
  const MinionTagTabPanel({super.key});

  @override
  State<MinionTagTabPanel> createState() => _MinionTagTabPanelState();
}

class _MinionTagTabPanelState extends State<MinionTagTabPanel> {
  int currentIndex = 0;

  List<Tab> tabs = [];

  @override
  Widget build(BuildContext context) {

    return TabView(
      
      tabs: tabs,
      currentIndex: currentIndex,
      onChanged: (index) => setState(() => currentIndex = index),
      tabWidthBehavior: TabWidthBehavior.sizeToContent,
      closeButtonVisibility: CloseButtonVisibilityMode.onHover,
      

      onNewPressed: () {
        setState(() {
            final index = tabs.length + 1;
            final tab = generateTab(index);
            tabs.add(tab);
          });
      },
      onReorder: (oldIndex, newIndex) {
        setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final item = tabs.removeAt(oldIndex);
            tabs.insert(newIndex, item);

            if (currentIndex == newIndex) {
              currentIndex = oldIndex;
            } else if (currentIndex == oldIndex) {
              currentIndex = newIndex;
            }
          });
      },
    );
  }

  /// Creates a tab for the given index
  Tab generateTab(int index) {
    late Tab tab;
    tab = Tab(
      text: Text('Document $index'),
      semanticLabel: 'Document #$index',
      icon: const FlutterLogo(),
      body: SizedBox.shrink(),
      
      onClosed: () {
        setState(() {
            tabs.remove(tab);

            if (currentIndex > 0) currentIndex--;
          });
      },
    );
    return tab;
  }

}
