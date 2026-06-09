import 'package:flutter/widgets.dart';

bool isUsableImageSource(String? source) {
  return source != null && source.isNotEmpty;
}

Widget buildPlatformImage(String source, {BoxFit fit = BoxFit.contain}) {
  if (!isUsableImageSource(source)) return const SizedBox.shrink();

  return Image.network(
    source,
    fit: fit,
  );
}
