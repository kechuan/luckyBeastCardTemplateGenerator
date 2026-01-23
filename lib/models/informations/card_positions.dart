// 使用相对坐标系统 (0.0 - 1.0)
import 'dart:ui';

class ElementPositions {
  //String assetPath;
  final Offset relativePosition; // 相对位置 (0.0 - 1.0)
  final double relativeSize;      // 相对大小 (0.0 - 1.0)

  const ElementPositions({
    //required this.assetPath,
    required this.relativePosition,
    this.relativeSize = 0.2, // 默认占容器的 20%
  });

  // 计算绝对位置
  Offset getAbsolutePosition(Size containerSize) {
    return Offset(
      relativePosition.dx * containerSize.width,
      relativePosition.dy * containerSize.height,
    );
  }

  // 计算绝对大小
  double getAbsoluteSize(Size containerSize) {
    return relativeSize * containerSize.width; // 基于宽度
  }
}