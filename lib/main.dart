import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/providers/app_model.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:lucky_beast_card_template_generator/widgets/views/fluent_navigation_view.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  //i18n
  LocaleSettings.useDeviceLocale();
  //window_manager
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
    minimumSize: Size(800, 600),
    size: Size(1200, 800),
    backgroundColor: Colors.transparent
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setAsFrameless(); 
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(
    TranslationProvider(child: const MyApp())
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => AppModel()),
        ChangeNotifierProvider(create: (_) => CardModel()),

      ],
      child: Builder(
        builder: (context) {

          final themeColorType = context.select<AppModel,SeasonType>((appModel) => appModel.themeColorType);

          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: FluentApp(
              themeMode: context.select<AppModel,ThemeMode>((appModel)=> appModel.themeMode),
              locale: context.select<AppModel,AppLocale>((appModel)=> appModel.appLocale).flutterLocale,
              localizationsDelegates: [
                FluentLocalizations.delegate,

              ],
              supportedLocales: AppLocaleUtils.supportedLocales,
              theme: FluentThemeData(
                brightness: Brightness.light,
                accentColor: AccentColor.swatch(
                  {
                    'normal': themeColorType.color,
                    
                  }
                ),

                scaffoldBackgroundColor: themeColorType.color.withValues(alpha: 0.3),
                inactiveColor: Colors.grey.withValues(alpha: 0.6),
                inactiveBackgroundColor: Colors.grey.withValues(alpha: 0.3),
                visualDensity: VisualDensity.standard,
                resources: ResourceDictionary.light(
                  
                )

              ),
              darkTheme: FluentThemeData(
                brightness: Brightness.dark,

                accentColor: AccentColor.swatch(
                {
                  'normal': themeColorType.color.withValues(alpha: 0.8),
                }
                ),
                scaffoldBackgroundColor: themeColorType.color.withValues(alpha: 0.2),
                inactiveColor: Colors.white.withValues(alpha: 0.6),
                inactiveBackgroundColor: Colors.white.withValues(alpha: 0.3),
                visualDensity: VisualDensity.standard,
              ),
              home: DragToResizeArea(
                child: const FluentLuckyBeastsTemplateNavigationView(),
              )
            ),
          );
        }
      )

    );
  }
}
