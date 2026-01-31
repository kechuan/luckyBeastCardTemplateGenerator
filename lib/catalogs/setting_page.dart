import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' as material;
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/internal/mdi_extension_icons.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: FluentTheme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: Padding16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              spacing: 24,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t.settingPage.name, style: TextStyle(fontSize: 24)),

                Card(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  backgroundColor: FluentTheme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.3),
                  child: Column(
                    spacing: 24,
                    children: [
                      Row(
                        spacing: 12,
                        children: [

                          Icon(material.Icons.palette, size: 24),

                          ...List.generate(SeasonType.values.length, (index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16)
                                ),
                                child: Selector<AppModel, SeasonType>(
                                  selector: (_, appModel) => appModel.themeColorType,
                                  builder: (_, themeColorType, _) {
                                    return ToggleButton(
                                      style: ToggleButtonThemeData(
                                        checkedButtonStyle: ButtonStyle(
                                          backgroundColor: WidgetStatePropertyAll(SeasonType.values[index].color),
                                          elevation: WidgetStatePropertyAll(0),
                                        ),

                                        uncheckedButtonStyle: ButtonStyle(
                                          elevation: WidgetStateProperty.all(1.5),
                                        ),

                                      ),
                                      checked: themeColorType == SeasonType.values[index],
                                      onChanged: (value) {
                                        if (value) {
                                          context.read<AppModel>().updateThemeColor = SeasonType.values[index];
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            convertElementTypeImageUrl(seasonType: SeasonType.values[index]),
                                            scale: 2.5,
                                          )
                                        ],
                                      ),
                                    );
                                  }
                                ),
                              );
                            }),

                        ]

                      ),

                      Row(
                        spacing: 12,
                        children: [

                          Icon(material.Icons.translate_sharp, size: 24),

                          ComboBox<AppLocale>(
                            value: LocaleSettings.currentLocale,
                            items: [
                              ComboBoxItem(
                                value: AppLocale.zhCn,
                                child: Text("简体中文"),
                              ),

                              ComboBoxItem(
                                value: AppLocale.en,
                                child: Text("English"),
                              ),
                            ],
                            onChanged: (value) {
                              context.read<AppModel>().updateAppLocale(value!);
                            },
                          )

                        ]

                      ),

                      Row(
                        spacing: 12,
                        children: [

                          Icon(material.Icons.dark_mode, size: 24),

                          Selector<AppModel, ThemeMode>(
                            selector: (_, appModel) => appModel.themeMode,
                            builder: (_, themeStatus, _) {
                              return ToggleSwitch(
                                checked: themeStatus == ThemeMode.dark,
                                onChanged: (value) => context.read<AppModel>().updateThemeMode = value ? ThemeMode.dark : ThemeMode.light,

                              );
                            }
                          )
                        ]
                      ),

                    ]
                  )
                ),

              ],
            ),

            Spacer(),

            Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(t.settingPage.about, style: TextStyle(fontSize: 24)),
                    IconButton(
                      icon:WindowsIcon(MdiExtensionIcons.github),
                      onPressed: () {
                        launchUrlString(APPRepository.githubRepository);
                      },
                    )
                  ],
                ),

                Card(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        spacing: 12,
                        children: [
                          Icon(material.Icons.info_outline, size: 16),
                          Text(t.settingPage.version),
                        ],
                      ),

                      Text(APPRepository.version)

                    ],
                  )
                ),

                Card(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        spacing: 12,
                        children: [
                          Icon(FluentIcons.feedback, size: 16),
                          Text(t.settingPage.gameOfficalQQGroup),
                        ],
                      ),

                      const SelectableText(APPRepository.gameOfficalQQGroup)

                    ],
                  )
                ),

                Card(
                  borderRadius: BorderRadiusGeometry.circular(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                        spacing: 12,
                        children: [
                          Icon(WindowsIcons.pen_palette, size: 16),
                          Text(t.settingPage.author),
                        ],
                      ),

                      Text(APPRepository.author)

                    ],
                  )
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
