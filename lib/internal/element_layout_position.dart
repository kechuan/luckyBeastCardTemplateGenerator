import 'dart:ui';

class ElementLayoutPosition {
  final double x;      // 左上角 X 坐标
  final double y;      // 左上角 Y 坐标
  final double width;  // 宽度
  final double height; // 高度

  const ElementLayoutPosition({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  // 根据设计稿尺寸和实际容器尺寸，计算缩放后的绝对位置
  Offset getScaledPosition(Size designSize, Size actualSize) {
    final scaleX = actualSize.width / designSize.width;
    final scaleY = actualSize.height / designSize.height;

    return Offset(
      x * scaleX,
      y * scaleY,
    );
  }

  // 获取缩放后的大小
  Size getScaledSize(Size designSize, Size actualSize) {
    final scaleX = actualSize.width / designSize.width;
    final scaleY = actualSize.height / designSize.height;

    return Size(
      width * scaleX,
      height * scaleY,
    );
  }

  ElementLayoutPosition copyWith({
    double? x,
    double? y,
    double? width,
    double? height,
  }){
    return ElementLayoutPosition(
      x: x ?? this.x,
      y: y ?? this.y,
      width:width ?? this.width,
      height:height ?? this.height,
    );
  }

  @override
  String toString() => 'DesignElementRect(x: $x, y: $y, w: $width, h: $height)';


}
