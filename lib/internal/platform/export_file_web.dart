import 'dart:js_interop';
import 'dart:typed_data';

import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:web/web.dart' as web;

bool get supportsOutputDirectorySelection => false;

String get defaultOutputDirectoryPath => '';

Future<String?> pickOutputDirectory() async => null;

Future<String?> savePngImage(
  String outputDirectory, {
  Uint8List? bytes,
  String? cardName,
}) async {
  if (bytes == null) return '[Image Convert Error] bytes is null';

  final blob = web.Blob(
    <JSAny>[bytes.toJS].toJS,
    web.BlobPropertyBag(type: 'image/png'),
  );
  final objectUrl = web.URL.createObjectURL(blob);

  final anchor = web.HTMLAnchorElement()
    ..href = objectUrl
    ..download = buildOutputImageFileName(cardName)
    ..style.display = 'none';

  web.document.body?.append(anchor);
  anchor.click();
  anchor.remove();
  web.URL.revokeObjectURL(objectUrl);

  return null;
}
