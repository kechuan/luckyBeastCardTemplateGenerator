import 'dart:math' as math;
import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';

class AdaptiveFontSizeText extends StatelessWidget {
  const AdaptiveFontSizeText({
    super.key,
    required this.text,
    required this.boxSize,
    required this.designFontSize, // 设计稿中定义的字体大小
    //this.fontWeight = FontWeight.normal,

    this.textAlign = TextAlign.center,
    this.maxLines,
    this.minFontSizeRatio = 0.3, // 最小字体大小比例（相对于设计值）
    this.letterSpacingFactor = 0.5,  // 字符间距估算因子
    this.strokeWidth,

    required this.scaleRatio,
  });

  final String text;
  final Size boxSize;
  final double designFontSize;
  //final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final double minFontSizeRatio;
  final double letterSpacingFactor;

  final double? strokeWidth;

  final double scaleRatio;
  

  @override
  Widget build(BuildContext context) {
    final adaptiveFontSize = calculateAdaptiveFontSize();
    
    return SizedBox(
      width: max(0,boxSize.width),
      height: max(0,boxSize.height),
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: adaptiveFontSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              
              height: 1.25,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth ?? 4.5
                ..strokeCap = StrokeCap.round
                ..strokeJoin = StrokeJoin.round
                ..color = Colors.black,
            ),
            textAlign: TextAlign.center,
    
          ),
    
          Text(
            text,
            style: TextStyle(
              letterSpacing: 1,
              fontSize: adaptiveFontSize,
              fontWeight: FontWeight.bold,
              height: 1.25,
              color: Colors.white,
              
            ),
            textAlign: TextAlign.center,
    
          ),
        ],
      )
      
      


    );
  }

  // 核心算法：计算自适应字体大小
  double calculateAdaptiveFontSize() {


    // 3. 计算需要缩放的比例
    //final scale = boxSize.width * (boxSize.height / kCardDesignSize.height);
    final scaledFontSize = designFontSize * scaleRatio;
    
    // 4. 确保不低于最小字体大小
    final minFontSize = designFontSize * minFontSizeRatio;
    
    return math.max(scaledFontSize, minFontSize);

  }
}
