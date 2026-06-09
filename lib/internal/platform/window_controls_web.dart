import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/widgets.dart';

Future<void> initializePlatformWindow() async {}

Widget buildPlatformWindowFrame({required Widget child}) {
  return child;
}

Widget buildPlatformWindowCaption(BuildContext context) {
  return const SizedBox.shrink();
}

void startPlatformWindowDragging() {}

Future<void> togglePlatformWindowMaximize() async {}
