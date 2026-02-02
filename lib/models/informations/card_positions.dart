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


/// 它会决定Stack的排列顺序 因为是以 .values 的形式顺序导出的
class ElementPositionConfigs { 
	static const Map<CardElementPositionType, ElementLayoutPosition> layouts = {
    
    CardElementPositionType.name: ElementLayoutPosition(
      x: 50,
      y: 68,
      width: 400,
      height: 55,
    ),
    
    
    CardElementPositionType.image: ElementLayoutPosition(
      x: 78,
      y: 118,
      width: 345,
      height: 450,
    ),

    CardElementPositionType.maskLayer: ElementLayoutPosition(
      x: 60,
      y: 350,
      width: 380,
      height: 220,
    ),
    
    
    CardElementPositionType.cost: ElementLayoutPosition(
      x: 46,
      y: 43,
      width: 50,
      height: 50,
    ),
    
    
    CardElementPositionType.attack: ElementLayoutPosition(
      x: 62,
      y: 582,
      width: 60,
      height: 60,
    ),
    
   
    CardElementPositionType.health: ElementLayoutPosition(
      x: 379,
      y: 589,
      width: 55,
      height: 55,
    ),

    CardElementPositionType.description: ElementLayoutPosition(
      x: 78,
      y: 407,
      width: 345,
      height: 162,
    ),

    CardElementPositionType.typeTag: ElementLayoutPosition(
      x: 160,
      y: 580,
      width: 180,
      height: 70,
    ),
	
    CardElementPositionType.gem: ElementLayoutPosition(
      x: 400.5,
      y: 56.5,
      width: 48,
      height: 48,
    ),

	CardElementPositionType.seasonRequirement: ElementLayoutPosition(
      x: 110,
      y: 30,
      width: 320,
      height: 40,
    ),
    
    
  };
  
  static ElementLayoutPosition? getLayout(CardElementPositionType type) => layouts[type];

}