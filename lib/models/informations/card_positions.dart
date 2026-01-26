// 使用相对坐标系统 (0.0 - 1.0)
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:lucky_beast_card_template_generator/internal/element_layout_position.dart';
import 'package:lucky_beast_card_template_generator/internal/enum.dart';

class ElementPosition extends Equatable {
  //String assetPath;
  final Offset relativePosition;
  final double relativeSize;     

  const ElementPosition({
    
    this.relativePosition = Offset.zero,
    this.relativeSize = 0, 
  });

  // 计算绝对位置
  Offset getAbsolutePosition(Size cardContainerSize) {
    return Offset(
      relativePosition.dx * cardContainerSize.width,
      relativePosition.dy * cardContainerSize.height,
    );
  }

  // 计算绝对大小
  double getAbsoluteSize(Size cardContainerSize) {
    return relativeSize * cardContainerSize.width; // 基于宽度
  }

	ElementPosition operator +(ElementPosition other) {
		return ElementPosition(
			relativePosition: relativePosition + other.relativePosition,
			relativeSize: relativeSize + other.relativeSize,
		);
	}

  @override
  List<Object?> get props => [relativePosition, relativeSize];

}


class ElementPositionConfigs { 
	static const Map<CardElementPositionType, ElementLayoutPosition> layouts = {
    // 卡牌名称：左上角 (50, 80)，大小 400x60
    CardElementPositionType.name: ElementLayoutPosition(
      x: 55,
      y: 68,
      width: 380,
      height: 55,
    ),
    
    // 卡牌图片：左上角 (50, 150)，大小 400x300
    CardElementPositionType.image: ElementLayoutPosition(
      x: 50,
      y: 150,
      width: 400,
      height: 300,
    ),
    
    // 费用数字：左上角 (20, 20)，大小 50x50
    CardElementPositionType.cost: ElementLayoutPosition(
      x: 45,
      y: 42,
      width: 50,
      height: 50,
    ),
    
    // 攻击力：左下角 (50, 620)，大小 60x60
    CardElementPositionType.attack: ElementLayoutPosition(
      x: 62,
      y: 582,
      width: 60,
      height: 60,
    ),
    
    // 生命值：右下角 (390, 620)，大小 60x60
    CardElementPositionType.health: ElementLayoutPosition(
      x: 379,
      y: 589,
      width: 55,
      height: 55,
    ),

	// 类型标签：左上角 (50, 460)，大小 300x40
    CardElementPositionType.inherentTag: ElementLayoutPosition(
      x: 85,
      y: 405,
      width: 325,
      height: 40,
    ),

	// 生命值：右下角 (390, 620)，大小 60x60
    CardElementPositionType.description: ElementLayoutPosition(
      x: 85,
      y: 445,
      width: 325,
      height: 120,
    ),

	// 类型标签：左上角 (50, 460)，大小 300x40
    CardElementPositionType.typeTag: ElementLayoutPosition(
      x: 200,
      y: 600,
      width: 60,
      height: 55,
    ),

	
    CardElementPositionType.gem: ElementLayoutPosition(
      x: 401,
      y: 56,
      width: 46,
      height: 46,
    ),

	CardElementPositionType.seasonRequirement: ElementLayoutPosition(
      x: 110,
      y: 30,
      width: 320,
      height: 40,
    ),
    
    
  };
  
  // 获取某个元素的设计稿配置
  static ElementLayoutPosition? getLayout(CardElementPositionType type) {
    return layouts[type];
  }
}