import 'package:fluent_ui/fluent_ui.dart';
import 'package:window_manager/window_manager.dart';

Future<void> initializePlatformWindow() async {
  await windowManager.ensureInitialized();

  const windowOptions = WindowOptions(
    titleBarStyle: TitleBarStyle.hidden,
    windowButtonVisibility: false,
    minimumSize: Size(800, 600),
    size: Size(1200, 800),
    backgroundColor: Color(0x00000000),
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setAsFrameless();
    await windowManager.show();
    await windowManager.focus();
  });
}

Widget buildPlatformWindowFrame({required Widget child}) {
  return DragToResizeArea(child: child);
}

Widget buildPlatformWindowCaption(BuildContext context) {
  return WindowCaption(
    brightness: FluentTheme.of(context).brightness == Brightness.dark
        ? Brightness.dark
        : Brightness.light,
    backgroundColor: Colors.transparent,
  );
}

void startPlatformWindowDragging() {
  windowManager.startDragging();
}

Future<void> togglePlatformWindowMaximize() async {
  if (await windowManager.isMaximized()) {
    await windowManager.restore();
  } else {
    await windowManager.maximize();
  }
}
