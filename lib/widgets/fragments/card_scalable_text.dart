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

    //this.isNeedReLayout = false,

  });

  final String text;
  final double boxSize;
  final double? fontSize;

  final double? strokeWidth;
  final Color? strokeColor;

  //  final bool isNeedReLayout;

  @override
  Widget build(BuildContext context) {
    // 根据文本长度动态计算字体大小
    final adjustFontSize = fontSize ?? calculateFontSize(text, max(0, boxSize));

    return SizedBox(
      width: max(0, boxSize),
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
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
    
    );
  }

  // 字体大小的负反馈调节
  double calculateFontSize(String text, double boxSize) {
    // 基准字体大小
    double fontSize = boxSize * 0.8;

    //暂无其他好的想法
    if (text.length * fontSize > boxSize) {
      fontSize *= 0.8;
    }

    return fontSize;

  }
}
