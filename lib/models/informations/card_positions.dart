// 使用相对坐标系统 (0.0 - 1.0)
import 'dart:ui';

import 'package:equatable/equatable.dart';

class ElementPositions extends Equatable {
  //String assetPath;
  final Offset relativePosition; // 相对位置 (0.0 - 1.0)
  final double relativeSize;      // 相对大小 (0.0 - 1.0)

  const ElementPositions({
    //required this.assetPath,
    this.relativePosition = Offset.zero,
    this.relativeSize = 0.0, // 默认占容器的 20%
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

  ElementPositions operator +(ElementPositions other) {
    return ElementPositions(
      relativePosition: relativePosition + other.relativePosition,
      relativeSize: relativeSize + other.relativeSize,
    );
  }
  
  @override
  List<Object?> get props => [relativePosition, relativeSize];

}