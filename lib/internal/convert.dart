
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:lucky_beast_card_template_generator/internal/const.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';

String convertCardTypeImageUrl({
  Set<SeasonType> seasonTypeSet = const {},
  CardType cardType = CardType.familliar,
}) {

  String targetResourcePath = "";
  String cardTypeSuffix = "";

  switch (cardType) {
    case CardType.familliar || CardType.player:{
      targetResourcePath = APPRepository.officalMinionTemplate;
      cardTypeSuffix = CardType.familliar.name;

    }

    case CardType.spellcard || CardType.construction:{
      targetResourcePath = APPRepository.officalSpellTemplate;
      cardTypeSuffix = CardType.spellcard.name;
    }

  }

  final orderSeasonList = seasonTypeSet.toList()..sort((a, b) => a.index.compareTo(b.index));

  return switch (orderSeasonList.length){
    0 => "$targetResourcePath/${SeasonType.wild.name}_$cardTypeSuffix.png",
    1 => "$targetResourcePath/${orderSeasonList.first.name}_$cardTypeSuffix.png",
    2 => "$targetResourcePath/${orderSeasonList.first.name}_${orderSeasonList.last.name}_$cardTypeSuffix.png",
    _ => "",

  };




}

String convertElementTypeImageUrl(
{
  SeasonType? seasonType,
}
) {
  return switch (seasonType) {
    SeasonType.wild => "${APPRepository.officalElementTemplate}/wild.png",
    SeasonType.spring => "${APPRepository.officalElementTemplate}/spring.png",
    SeasonType.summer => "${APPRepository.officalElementTemplate}/summer.png",
    SeasonType.autumn => "${APPRepository.officalElementTemplate}/autumn.png",
    SeasonType.winter => "${APPRepository.officalElementTemplate}/winter.png",
    _ => "${APPRepository.officalElementTemplate}/mana.png",

  };
}

String convertCardRarityTypeImageUrl(CardRarity cardRarity)
=> "${APPRepository.officalRarityTemplate}/${cardRarity.name}.png";

String convertDigitNumString(int originalNumber, {int numberBits = 2}) {

  String fillingContent = '';

  if (originalNumber >= pow(10, numberBits - 1)) {
    return '$originalNumber';
  }

  else {
    fillingContent = '0' * (numberBits - ('$originalNumber'.length));
    return '$fillingContent$originalNumber';
  }


}

Future<Uint8List> captureInvisibleWidget({
  required Widget widget,
  Size? size,
}) async {
  // 1. 创建独立的渲染边界
  final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();

  // 2. 配置逻辑视口
  final view = ui.PlatformDispatcher.instance.views.first;
  final renderView = RenderView(
    view: view,
    child: RenderPositionedBox(alignment: Alignment.center, child: repaintBoundary),
    configuration: ViewConfiguration(
      logicalConstraints: BoxConstraints.tight(size ?? kCardDesignSize),
      devicePixelRatio: 1.0, // 导出图的缩放比例
    ),
  );

  // 3. 初始化流水线
  final pipelineOwner = PipelineOwner();
  final buildOwner = BuildOwner(focusManager: FocusManager());
  pipelineOwner.rootNode = renderView;
  renderView.prepareInitialFrame();

  // 4. 将 Widget 挂载到这个独立的渲染树上
  final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
    container: repaintBoundary,
    child: Directionality(
      textDirection: TextDirection.ltr,
      child: widget,
    ),
  ).attachToRenderTree(buildOwner);

  // 5. 强制触发构建、布局和绘制
  buildOwner.buildScope(rootElement);
  buildOwner.finalizeTree();
  pipelineOwner.flushLayout();
  pipelineOwner.flushCompositingBits();
  pipelineOwner.flushPaint();

  // 6. 转换为图片
  ui.Image image = await repaintBoundary.toImage(pixelRatio: 1.0);
  ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

  return byteData!.buffer.asUint8List();
}

Future<String?> saveAsOnWindows(
  String outputDirectory,
  {
    Uint8List? bytes,
    String? cardName,
  }
) async {
  
  if (bytes == null) return '[Image Convert Error] bytes is null';

  final currentTime = DateTime.now();

  cardName ??= 
  'output_${convertDigitNumString(currentTime.month)}-${convertDigitNumString(currentTime.day)}_${convertDigitNumString(currentTime.hour)}.${convertDigitNumString(currentTime.minute)}';
  try{
    final imageFile = File('$outputDirectory${Platform.pathSeparator}$cardName.png');
    await imageFile.writeAsBytes(bytes, flush: true);
  }

  on IOException catch(e){
    debugPrint("[Image Output Error] $e");
    return e.toString();
  }

  return null;

}

