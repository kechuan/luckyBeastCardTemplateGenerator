import 'dart:io';

import 'package:desktop_drop/desktop_drop.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';

Map<String, String> collectIllustrationsFromDroppedItems(
  Iterable<DropItem> items,
) {
  final illustrations = <String, String>{};

  for (final item in items) {
    if (item is DropItemDirectory && item.children.isNotEmpty) {
      illustrations.addAll(collectIllustrationsFromDroppedItems(item.children));
    } else {
      illustrations.addAll(collectIllustrationsFromPath(item.path));
    }
  }

  return illustrations;
}

Map<String, String> collectIllustrationsFromPath(String path) {
  final importPath = <String, String>{};
  final fileType = FileSystemEntity.typeSync(path);

  if (fileType == FileSystemEntityType.file) {
    if (_isSupportedIllustrationName(path)) {
      importPath[path] = _baseName(path);
    }
  } else if (fileType == FileSystemEntityType.directory) {
    final entities = Directory(path).listSync();

    for (final entity in entities) {
      importPath.addAll(collectIllustrationsFromPath(entity.path));
    }
  }

  return importPath;
}

String displayNameForIllustration(String source, String? storedName) {
  return storedName ?? _baseName(source);
}

bool _isSupportedIllustrationName(String name) {
  final extension = name.split('.').last.toLowerCase();
  return kIllustrationType.contains(extension);
}

String _baseName(String path) {
  return path.split(Platform.pathSeparator).last;
}
