import 'dart:io';

import 'package:filepicker_windows/filepicker_windows.dart';
import 'package:flutter/foundation.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/debug_log.dart';

bool get supportsOutputDirectorySelection => true;

String get defaultOutputDirectoryPath => Directory('').absolute.path;

Future<String?> pickOutputDirectory() async {
  return DirectoryPicker().getDirectory()?.path;
}

Future<String?> savePngImage(
  String outputDirectory, {
  Uint8List? bytes,
  String? cardName,
}) async {
  if (bytes == null) return '[Image Convert Error] bytes is null';

  final fileName = buildOutputImageFileName(cardName);

  try {
    final imageFile = File(
      '$outputDirectory${Platform.pathSeparator}$fileName',
    );
    await imageFile.writeAsBytes(bytes, flush: true);
  } on IOException catch (e) {
    debugLog('[Image Output Error] $e');
    return e.toString();
  }

  return null;
}
