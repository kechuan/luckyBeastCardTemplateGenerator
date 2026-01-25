//import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_basic_information_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_details_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_overlay_positions_panel.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/season_requirement_toggle.dart';

class FluentCardPropView extends StatelessWidget {
  const FluentCardPropView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        child: ListView(
          //spacing: 12,
          children: [
            Center(child: Text(t.cardPropPanel.name)),Padding(padding: PaddingV6),
      
            const CardBasicInformationPanel(),
      
            Divider(),Padding(padding: PaddingV6),
      
            const SeasonRequirementToggle(),
      
            Divider(),Padding(padding: PaddingV6),
      
            const CardDetailsPanel(),

            Divider(),Padding(padding: PaddingV6),

            const CardOverlayPositionsPanel(),



          ],
        ),
      ),
    );
  }
}