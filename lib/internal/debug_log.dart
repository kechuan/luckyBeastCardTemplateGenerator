import 'package:flutter/foundation.dart';

void debugLog(String? message, {int? wrapWidth}) {
  if (!kDebugMode) return;

  debugPrint(message, wrapWidth: wrapWidth);
}
