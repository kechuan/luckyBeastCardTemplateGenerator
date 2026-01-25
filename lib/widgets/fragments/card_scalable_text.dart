import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';

class CardScalableText extends StatelessWidget {
  const CardScalableText({
    super.key,
    required this.text,
    required this.boxSize,

    this.strokeWidth,
    this.strokeColor,
    this.fontSize,

    //this.baseFontSizeRatio = 0.8, // 基准字体大小比例
    

  });

  final String text;
  final double boxSize;
  final double? fontSize;
  //final double baseFontSizeRatio;
  //final double maxFontSizeRatio;

  final double? strokeWidth;
  final Color? strokeColor;

  @override
  Widget build(BuildContext context) {
    // 根据文本长度动态计算字体大小
    final adjustFontSize = fontSize ?? calculateFontSize(text, max(0, boxSize));

    return Transform.translate(
      offset: text.length > 1 ? Offset(0, -(1/adjustFontSize)*text.length) : Offset.zero,
      child: SizedBox(
        width: max(0, boxSize),
        // 不设置高度约束，让文本自然换行
        child: Stack(
          alignment: AlignmentGeometry.center,
          children: [
            // 第一层：描边层 (黑边)
            Text(
              text,
              style: TextStyle(
                fontSize: adjustFontSize,
                fontWeight: FontWeight.bold,
                height: 1.25,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = strokeWidth ?? 4.5
                  ..strokeCap = StrokeCap.round
                  ..strokeJoin = StrokeJoin.round
                  ..color = strokeColor ?? Colors.black,
              ),

            ),
            // 第二层：填充层 (白字)
            Text(
              text,
              style: TextStyle(
                fontSize: adjustFontSize,
                fontWeight: FontWeight.bold,
                height: 1.25,
                color: Colors.white,
              ),

            ),
          ],
        )

      ),
    );
  }

  // 动态计算字体大小
  double calculateFontSize(String text, double boxSize) {
    // 基准字体大小
    double fontSize = boxSize * 0.8;

    if (text.length > 1) {
      fontSize = (boxSize / text.length) * 1.25;
    }

    // 确保不低于最小值
    return fontSize;

  }
}
