import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/i18n/strings.g.dart';
import 'package:lucky_beast_card_template_generator/models/providers/navigation_panel_model.dart';
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
      // 增加这一行，强制设置窗口为无边框但保留交互
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
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    LocaleSettings.setLocale(AppLocale.zhCn);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationPanelModel(
          appLocale: TranslationProvider.of(context).locale
        )),
      ],
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: FluentApp(
          locale: TranslationProvider.of(context).flutterLocale,
          supportedLocales: AppLocaleUtils.supportedLocales,
          theme: FluentThemeData(
            brightness: Brightness.light,
            accentColor: Colors.orange,
            visualDensity: VisualDensity.standard,
          ),
          home: DragToResizeArea(
            child: const FluentLuckyBeastsTemplateNavigationView(),
          )
        ),
      )
      
    );
  }
}
