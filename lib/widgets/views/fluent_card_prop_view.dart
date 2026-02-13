//import 'package:flutter/material.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/extensions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_basic_information_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_details_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_illustration_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_overlay_positions_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/season_element_requirement_panel.dart';
import 'package:provider/provider.dart';

class FluentCardPropView extends StatefulWidget {
  const FluentCardPropView({super.key});

  @override
  State<FluentCardPropView> createState() => _FluentCardPropViewState();
}

class _FluentCardPropViewState extends State<FluentCardPropView> {

  ValueNotifier<bool> dragNotifier = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final appModel = context.read<AppModel>();

    return Stack(
      children: [

        Card(
          backgroundColor: FluentTheme.of(context).scaffoldBackgroundColor,
          child: DropTarget(
            onDragEntered: (details) {
              dragNotifier.value = true;
            },
            onDragDone: (details) {

              for (DropItem currentFileSystemEntity in details.files){

                appModel.updateIllustrationPaths = appModel.illustrationPaths.copyWithAddAll(
                  appModel.handleImportIllustration(currentFileSystemEntity.path).toList()
                ).toSet();

              }

              //debugPrint("Path: $importPath");
              dragNotifier.value = false;
            },
            onDragExited: (details) {
              dragNotifier.value = false;
            },

            child: Column(
              spacing: 6,
              children: [

                Flexible(
                  child: ListView(
                    //spacing: 12,
                    children: [

                      Center(child: Text(t.cardPropPanel.name)), Padding(padding: PaddingV6),

                      const CardIllustrationPanel(),

                      Divider(), Padding(padding: PaddingV6),

                      const CardBasicInformationPanel(),

                      Divider(), Padding(padding: PaddingV6),

                      const SeasonRequirementPanel(),

                      Divider(), Padding(padding: PaddingV6),

                      const CardDetailsPanel(),

                      Divider(), Padding(padding: PaddingV6),

                      const CardOverlayPositionsPanel(),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.only(top: 16),
                  child: Center(
                    child: Text(
                      t.outputPanel.outputTips,
                      style: TextStyle(
                        color: FluentTheme.of(context).inactiveColor
                      ),
                    )
                  ),
                ),

              ],
            )

          ),
        ),

        ValueListenableBuilder(
          valueListenable: dragNotifier,
          builder: (_, dragStatus, _) {
            return AnimatedPositioned(
              bottom: dragStatus ? 50 : -50,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 350,
                padding: PaddingH16,
                //隔离: 父级只传递明确约束 子级自行根据center布局
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black.withValues(alpha: 0.2)
                  ),
                  child: Center(child: Text(t.cardPropPanel.illustrationSelect.dragTip, style: TextStyle(color: Colors.white)))
                ),
              )
            );
          },
        )

      ],
    );
  }
}
