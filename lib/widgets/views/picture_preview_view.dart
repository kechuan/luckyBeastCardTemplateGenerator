import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:lucky_beast_card_template_generator/internal/convert.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';
import 'package:lucky_beast_card_template_generator/models/informations/card_positions.dart';
import 'package:lucky_beast_card_template_generator/models/providers/card_model.dart';
import 'package:provider/provider.dart';



class PicturePreviewView extends StatefulWidget {
  const PicturePreviewView({super.key});

  @override
  State<PicturePreviewView> createState() => _PicturePreviewViewState();
}

class _PicturePreviewViewState extends State<PicturePreviewView> {


  // 固定的设计尺寸 (基准尺寸)
  static const Size designSize = Size(500, 700);
  
  final GlobalKey boundaryKey = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
    
        // 计算合适的显示尺寸 (保持宽高比)
        final aspectRatio = designSize.width / designSize.height;
    
        double displayWidth = constraints.maxWidth * 0.8;
        double displayHeight = displayWidth / aspectRatio;
    
        if (displayHeight > constraints.maxHeight * 0.9) {
          displayHeight = constraints.maxHeight * 0.9;
          displayWidth = displayHeight * aspectRatio;
        }
    
        final displaySize = Size(displayWidth, displayHeight);
    
        return Center(
          child: Container(
            width: displayWidth,
            height: displayHeight,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
    
            child: RepaintBoundary(
              key: boundaryKey,
              child: CardContent(
                containerSize: displaySize,
              ),
            ),
          ),
        );
      },
    );
  }

  

}

class CardContent extends StatefulWidget {
  const CardContent({
    super.key,
    required this.containerSize

  });

  final Size containerSize;

  @override
  State<CardContent> createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  
  final List<ElementPositions> elements = CardElementPositionType.values.map((e)=>e.relativePosition).toList();

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        // 背景层
        Selector<CardModel, (SeasonType,CardType)>(
          selector: (_, model) => (model.cardDetails.seasonType, model.cardDetails.cardType),
          builder: (_,data,_) {
            return Positioned.fill(
              child: Image.asset(
                convertCardTypeImageUrl(data.$1,cardType:data.$2)
              ),
            );
          }
        ),
    
        // 元素层 (根据容器大小自动计算位置)
        ...elements.map((element) {
            final absPos = element.getAbsolutePosition(widget.containerSize);
            final absSize = element.getAbsoluteSize(widget.containerSize);
    
            return Positioned(
              left: absPos.dx,
              top: absPos.dy,
              child: SizedBox(
                width: absSize,
                height: absSize,
                child: Center(
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                    size: absSize * 0.45,
                  ),
                ),
              ),
            );
          }),
    
        // 调试信息 (可选)
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              '${widget.containerSize.width.toInt()} x ${widget.containerSize.height.toInt()}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontFamily: 'monospace',
              ),
            ),
          ),
        ),
      ],
    );

  }

  // 导出固定尺寸的高清图片
  Future<void> exportCard({Size? exportSize}) async {
    try {
      // 默认导出尺寸 (可以设置更高分辨率)
      final targetSize = exportSize ?? const Size(1200, 1800); // 4倍高清

      // 创建离屏画布
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);

      // 绘制背景
      final bgPaint = Paint()..color = Colors.blue.shade100;
      canvas.drawRect(
        Rect.fromLTWH(0, 0, targetSize.width, targetSize.height),
        bgPaint,
      );

      // 绘制文字提示 (实际使用时替换为图片)
      final textPainter = TextPainter(
        text: const TextSpan(
          text: '背景图片',
          style: TextStyle(fontSize: 48, color: Colors.white54),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          (targetSize.width - textPainter.width) / 2,
          (targetSize.height - textPainter.height) / 2,
        ),
      );

      // 绘制所有元素 (按相对坐标映射)
      for (var element in elements) {
        final absPos = element.getAbsolutePosition(targetSize);
        final absSize = element.getAbsoluteSize(targetSize);

        final elementPaint = Paint()..color = Colors.orange;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(absPos.dx, absPos.dy, absSize, absSize),
            const Radius.circular(8),
          ),
          elementPaint,
        );

        // 绘制星星图标 (示意)
        final starPainter = TextPainter(
          text: TextSpan(
            text: '⭐',
            style: TextStyle(fontSize: absSize * 0.6),
          ),
          textDirection: TextDirection.ltr,
        );
        starPainter.layout();
        starPainter.paint(
          canvas,
          Offset(
            absPos.dx + (absSize - starPainter.width) / 2,
            absPos.dy + (absSize - starPainter.height) / 2,
          ),
        );
      }

      // 转换为图片
      final picture = recorder.endRecording();
      final image = await picture.toImage(
        targetSize.width.toInt(),
        targetSize.height.toInt(),
      );
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      final pngBytes = byteData!.buffer.asUint8List();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '导出成功! ${targetSize.width.toInt()}x${targetSize.height.toInt()} '
              '大小: ${(pngBytes.length / 1024).toStringAsFixed(1)} KB',
            ),
          ),
        );
      }

      debugPrint('导出图片: ${targetSize.width}x${targetSize.height}, ${pngBytes.length} bytes');

    } 

    catch (e) {
      debugPrint('导出失败: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('导出失败: $e')),
        );
      }
    }
  }
}
