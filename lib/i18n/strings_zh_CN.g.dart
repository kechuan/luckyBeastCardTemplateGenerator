///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsZhCn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

	// Translations
	@override String get appTitle => '东方灵麟棋卡牌生成器';
	@override late final _TranslationsNavigationPanelZhCn navigationPanel = _TranslationsNavigationPanelZhCn._(_root);
	@override late final _TranslationsCardPropPanelZhCn cardPropPanel = _TranslationsCardPropPanelZhCn._(_root);
	@override late final _TranslationsOutputPanelZhCn outputPanel = _TranslationsOutputPanelZhCn._(_root);
	@override late final _TranslationsSettingPageZhCn settingPage = _TranslationsSettingPageZhCn._(_root);
}

// Path: navigationPanel
class _TranslationsNavigationPanelZhCn implements TranslationsNavigationPanelEn {
	_TranslationsNavigationPanelZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '导航栏';
	@override String get palette => '卡牌创作';
	@override String get setting => '设置';
	@override String get exportButton => '导出图片';
}

// Path: cardPropPanel
class _TranslationsCardPropPanelZhCn implements TranslationsCardPropPanelEn {
	_TranslationsCardPropPanelZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '卡牌属性面板';
	@override late final _TranslationsCardPropPanelIllustrationSelectZhCn illustrationSelect = _TranslationsCardPropPanelIllustrationSelectZhCn._(_root);
	@override late final _TranslationsCardPropPanelBasicPropZhCn basicProp = _TranslationsCardPropPanelBasicPropZhCn._(_root);
	@override late final _TranslationsCardPropPanelSeasonElementSelectZhCn seasonElementSelect = _TranslationsCardPropPanelSeasonElementSelectZhCn._(_root);
	@override late final _TranslationsCardPropPanelCardDetailZhCn cardDetail = _TranslationsCardPropPanelCardDetailZhCn._(_root);
	@override late final _TranslationsCardPropPanelElementPositionsZhCn elementPositions = _TranslationsCardPropPanelElementPositionsZhCn._(_root);
}

// Path: outputPanel
class _TranslationsOutputPanelZhCn implements TranslationsOutputPanelEn {
	_TranslationsOutputPanelZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '图片导出';
	@override String get outputTips => '创作后点击左下角以开始导出流程';
	@override String get imageSize => '图片尺寸';
	@override String get customSize => '自定义';
	@override String get width => '宽';
	@override String get height => '高';
	@override String get outputPath => '输出路径';
	@override String get cancel => '取消';
	@override String get ok => '导出';
}

// Path: settingPage
class _TranslationsSettingPageZhCn implements TranslationsSettingPageEn {
	_TranslationsSettingPageZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '设置页';
	@override String get about => '关于';
	@override String get version => '版本信息';
	@override String get gameOfficalQQGroup => '游戏官方交流群';
	@override String get author => '项目作者';
	@override String get updateCheck => '检查更新';
}

// Path: cardPropPanel.illustrationSelect
class _TranslationsCardPropPanelIllustrationSelectZhCn implements TranslationsCardPropPanelIllustrationSelectEn {
	_TranslationsCardPropPanelIllustrationSelectZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '卡面选择';
	@override String get emptyPromptPart => '拖拽图片文件或文件夹到面板以导入素材';
	@override String get dragTip => '释放以导入素材';
	@override String get forbiddenPictureFormatTip => '该文件格式不受支持';
}

// Path: cardPropPanel.basicProp
class _TranslationsCardPropPanelBasicPropZhCn implements TranslationsCardPropPanelBasicPropEn {
	_TranslationsCardPropPanelBasicPropZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '基础属性';
	@override String get cardName => '卡牌名称';
	@override late final _TranslationsCardPropPanelBasicPropCardRarityZhCn cardRarity = _TranslationsCardPropPanelBasicPropCardRarityZhCn._(_root);
	@override String get illustrationPath => '图片路径';
}

// Path: cardPropPanel.seasonElementSelect
class _TranslationsCardPropPanelSeasonElementSelectZhCn implements TranslationsCardPropPanelSeasonElementSelectEn {
	_TranslationsCardPropPanelSeasonElementSelectZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '季语选择';
	@override String get cardCost => '灵力花费';
	@override String get seasonElementRequirement => '季语需求';
}

// Path: cardPropPanel.cardDetail
class _TranslationsCardPropPanelCardDetailZhCn implements TranslationsCardPropPanelCardDetailEn {
	_TranslationsCardPropPanelCardDetailZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '卡牌详细设置';
	@override late final _TranslationsCardPropPanelCardDetailCardTypeZhCn cardType = _TranslationsCardPropPanelCardDetailCardTypeZhCn._(_root);
	@override String get minionTagSetting => '使魔Tag设置';
	@override String get newMinionTag => '新建';
	@override String get minionTagPlaceHolder => '点击对应标签以删除';
	@override String get cardDescription => '卡牌效果描述';
	@override String get cardDescriptionPlaceHolder => '输入卡牌描述,使用{文字}描述特殊行动';
	@override String get cardKeyWordSetting => '卡牌关键字设置';
}

// Path: cardPropPanel.elementPositions
class _TranslationsCardPropPanelElementPositionsZhCn implements TranslationsCardPropPanelElementPositionsEn {
	_TranslationsCardPropPanelElementPositionsZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '元素方位';
	@override String get displayReferenceLine => '显示参考线';
	@override String get elementToggle => '调整元素';
	@override String get resetCurrentElement => '重置当前元素调整';
	@override late final _TranslationsCardPropPanelElementPositionsCardElementPositionTypeZhCn cardElementPositionType = _TranslationsCardPropPanelElementPositionsCardElementPositionTypeZhCn._(_root);
}

// Path: cardPropPanel.basicProp.cardRarity
class _TranslationsCardPropPanelBasicPropCardRarityZhCn implements TranslationsCardPropPanelBasicPropCardRarityEn {
	_TranslationsCardPropPanelBasicPropCardRarityZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '稀有度';
	@override String get normal => '普通';
	@override String get unusual => '罕见';
	@override String get rare => '稀有';
	@override String get mythic => '传说';
}

// Path: cardPropPanel.cardDetail.cardType
class _TranslationsCardPropPanelCardDetailCardTypeZhCn implements TranslationsCardPropPanelCardDetailCardTypeEn {
	_TranslationsCardPropPanelCardDetailCardTypeZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '卡牌类型';
	@override String get minion => '使魔';
	@override String get spellcard => '符卡';
	@override String get construction => '建筑物';
}

// Path: cardPropPanel.elementPositions.cardElementPositionType
class _TranslationsCardPropPanelElementPositionsCardElementPositionTypeZhCn implements TranslationsCardPropPanelElementPositionsCardElementPositionTypeEn {
	_TranslationsCardPropPanelElementPositionsCardElementPositionTypeZhCn._(this._root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '名称';
	@override String get image => '卡面';
	@override String get cost => '灵力花费';
	@override String get gem => '稀有度';
	@override String get seasonRequirement => '季语需求';
	@override String get attack => '攻击力';
	@override String get health => '生命值';
	@override String get typeTag => '使魔Tag';
	@override String get description => '卡牌描述';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => '东方灵麟棋卡牌生成器',
			'navigationPanel.name' => '导航栏',
			'navigationPanel.palette' => '卡牌创作',
			'navigationPanel.setting' => '设置',
			'navigationPanel.exportButton' => '导出图片',
			'cardPropPanel.name' => '卡牌属性面板',
			'cardPropPanel.illustrationSelect.name' => '卡面选择',
			'cardPropPanel.illustrationSelect.emptyPromptPart' => '拖拽图片文件或文件夹到面板以导入素材',
			'cardPropPanel.illustrationSelect.dragTip' => '释放以导入素材',
			'cardPropPanel.illustrationSelect.forbiddenPictureFormatTip' => '该文件格式不受支持',
			'cardPropPanel.basicProp.name' => '基础属性',
			'cardPropPanel.basicProp.cardName' => '卡牌名称',
			'cardPropPanel.basicProp.cardRarity.name' => '稀有度',
			'cardPropPanel.basicProp.cardRarity.normal' => '普通',
			'cardPropPanel.basicProp.cardRarity.unusual' => '罕见',
			'cardPropPanel.basicProp.cardRarity.rare' => '稀有',
			'cardPropPanel.basicProp.cardRarity.mythic' => '传说',
			'cardPropPanel.basicProp.illustrationPath' => '图片路径',
			'cardPropPanel.seasonElementSelect.name' => '季语选择',
			'cardPropPanel.seasonElementSelect.cardCost' => '灵力花费',
			'cardPropPanel.seasonElementSelect.seasonElementRequirement' => '季语需求',
			'cardPropPanel.cardDetail.name' => '卡牌详细设置',
			'cardPropPanel.cardDetail.cardType.name' => '卡牌类型',
			'cardPropPanel.cardDetail.cardType.minion' => '使魔',
			'cardPropPanel.cardDetail.cardType.spellcard' => '符卡',
			'cardPropPanel.cardDetail.cardType.construction' => '建筑物',
			'cardPropPanel.cardDetail.minionTagSetting' => '使魔Tag设置',
			'cardPropPanel.cardDetail.newMinionTag' => '新建',
			'cardPropPanel.cardDetail.minionTagPlaceHolder' => '点击对应标签以删除',
			'cardPropPanel.cardDetail.cardDescription' => '卡牌效果描述',
			'cardPropPanel.cardDetail.cardDescriptionPlaceHolder' => '输入卡牌描述,使用{文字}描述特殊行动',
			'cardPropPanel.cardDetail.cardKeyWordSetting' => '卡牌关键字设置',
			'cardPropPanel.elementPositions.name' => '元素方位',
			'cardPropPanel.elementPositions.displayReferenceLine' => '显示参考线',
			'cardPropPanel.elementPositions.elementToggle' => '调整元素',
			'cardPropPanel.elementPositions.resetCurrentElement' => '重置当前元素调整',
			'cardPropPanel.elementPositions.cardElementPositionType.name' => '名称',
			'cardPropPanel.elementPositions.cardElementPositionType.image' => '卡面',
			'cardPropPanel.elementPositions.cardElementPositionType.cost' => '灵力花费',
			'cardPropPanel.elementPositions.cardElementPositionType.gem' => '稀有度',
			'cardPropPanel.elementPositions.cardElementPositionType.seasonRequirement' => '季语需求',
			'cardPropPanel.elementPositions.cardElementPositionType.attack' => '攻击力',
			'cardPropPanel.elementPositions.cardElementPositionType.health' => '生命值',
			'cardPropPanel.elementPositions.cardElementPositionType.typeTag' => '使魔Tag',
			'cardPropPanel.elementPositions.cardElementPositionType.description' => '卡牌描述',
			'outputPanel.name' => '图片导出',
			'outputPanel.outputTips' => '创作后点击左下角以开始导出流程',
			'outputPanel.imageSize' => '图片尺寸',
			'outputPanel.customSize' => '自定义',
			'outputPanel.width' => '宽',
			'outputPanel.height' => '高',
			'outputPanel.outputPath' => '输出路径',
			'outputPanel.cancel' => '取消',
			'outputPanel.ok' => '导出',
			'settingPage.name' => '设置页',
			'settingPage.about' => '关于',
			'settingPage.version' => '版本信息',
			'settingPage.gameOfficalQQGroup' => '游戏官方交流群',
			'settingPage.author' => '项目作者',
			'settingPage.updateCheck' => '检查更新',
			_ => null,
		};
	}
}
