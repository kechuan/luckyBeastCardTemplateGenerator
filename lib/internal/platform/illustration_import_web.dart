import 'package:desktop_drop/desktop_drop.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';

Map<String, String> collectIllustrationsFromDroppedItems(
  Iterable<DropItem> items,
) {
  final illustrations = <String, String>{};

  for (final item in items) {
    if (item is DropItemDirectory) {
      illustrations.addAll(collectIllustrationsFromDroppedItems(item.children));
    } else if (_isSupportedIllustrationItem(item)) {
      illustrations[item.path] = item.name;
    }
  }

  return illustrations;
}

Map<String, String> collectIllustrationsFromPath(String path) {
  return const {};
}

String displayNameForIllustration(String source, String? storedName) {
  return storedName ?? source;
}

bool _isSupportedIllustrationItem(DropItem item) {
  final extension = item.name.split('.').last.toLowerCase();
  final mimeType = item.mimeType?.toLowerCase() ?? '';

  return kIllustrationType.contains(extension) || mimeType.startsWith('image/');
}
