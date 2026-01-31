import 'dart:math' as math;

import 'package:fluent_ui/fluent_ui.dart';
import 'package:lucky_beast_card_template_generator/widgets/components/card_description_panel.dart';

class ScalableFontSizeText extends StatelessWidget {
  const ScalableFontSizeText({
    super.key,
    required this.text,
    required this.toggleScaleRatio,
    required this.designFontSize, // 设计稿中定义的字体大小
	  required this.scaleRatio,

    this.strokeWidth,
    this.stackTextAlign = AlignmentGeometry.center,
    this.textFontFamily,
    this.fontWeight

    
  });

  final String text;
  final double toggleScaleRatio;
  final double designFontSize;
  final double scaleRatio;

  final AlignmentGeometry? stackTextAlign;

  final FontWeight? fontWeight;
  final String? textFontFamily;

  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    final scalableFontSize = calculateScalableFontSize();

    return Transform.scale(
      scale: 1+toggleScaleRatio,
      child: Stack(
        alignment: stackTextAlign ?? AlignmentGeometry.center,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: scalableFontSize,
              fontWeight: fontWeight ?? FontWeight.bold,
              letterSpacing: 1,
      
              height: 1.25,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeWidth ?? 4.5
                ..strokeCap = StrokeCap.round
                ..strokeJoin = StrokeJoin.round
                ..color = Colors.black,
              fontFamily: textFontFamily
            ),
            
            textAlign: TextAlign.center,
      
          ),
      
          Text(
            text,
            style: TextStyle(
              letterSpacing: 1,
              fontSize: scalableFontSize,
              fontWeight: fontWeight ?? FontWeight.bold,
              height: 1.25,
              color: Colors.white,
              fontFamily: textFontFamily
            
            ),
            textAlign: TextAlign.center,
      
          ),
        ],
      ),
    );
  }

  // 粗略的负反馈调节
  double calculateScalableFontSize() {
    final scaledFontSize = designFontSize * scaleRatio;
    return math.max(scaledFontSize, designFontSize * 0.3);
  }
}

class ScalableFontSizeTextSpan extends ScalableFontSizeText {
  const ScalableFontSizeTextSpan({
    super.key, 
    required super.text,
    required super.toggleScaleRatio,
    required super.designFontSize,
    required super.scaleRatio,
    super.textFontFamily, 
  });

  @override
  Widget build(BuildContext context) {
    final scalableFontSize = calculateScalableFontSize();

    return Transform.scale(
      scale: 1+toggleScaleRatio,
      //width: max(0,boxSize.width),
      //height: max(0,boxSize.height),
      child: Text.rich(
        TextSpan(
          children: [
            parseMarkedText(text)
          ]
        ),
        style: TextStyle(
          fontSize: scalableFontSize,
          letterSpacing: 1,
          height: 1.5,
          color: Colors.white,
          fontFamily: textFontFamily
        ),
      ),
    );

  }


}
