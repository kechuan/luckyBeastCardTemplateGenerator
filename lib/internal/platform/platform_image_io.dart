import 'dart:io';

import 'package:flutter/widgets.dart';

bool isUsableImageSource(String? source) {
  return source != null && source.isNotEmpty && File(source).existsSync();
}

Widget buildPlatformImage(String source, {BoxFit fit = BoxFit.contain}) {
  if (!isUsableImageSource(source)) return const SizedBox.shrink();

  return Image.file(
    File(source),
    fit: fit,
  );
}
