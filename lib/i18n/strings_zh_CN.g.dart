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
class TranslationsZhCn extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZhCn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zhCn,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh-CN>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZhCn _root = this; // ignore: unused_field

	@override 
	TranslationsZhCn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZhCn(meta: meta ?? this.$meta);

	// Translations
	@override String get appTitle => '东方灵麟棋卡牌模板生成器';
	@override late final _TranslationsCardPropPanelZhCn cardPropPanel = _TranslationsCardPropPanelZhCn._(_root);
}

// Path: cardPropPanel
class _TranslationsCardPropPanelZhCn extends TranslationsCardPropPanelEn {
	_TranslationsCardPropPanelZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Card Properties Panel';
	@override late final _TranslationsCardPropPanelBasicPropZhCn basicProp = _TranslationsCardPropPanelBasicPropZhCn._(_root);
	@override late final _TranslationsCardPropPanelSeasonElementSelectZhCn seasonElementSelect = _TranslationsCardPropPanelSeasonElementSelectZhCn._(_root);
	@override late final _TranslationsCardPropPanelCardDetailZhCn cardDetail = _TranslationsCardPropPanelCardDetailZhCn._(_root);
}

// Path: cardPropPanel.basicProp
class _TranslationsCardPropPanelBasicPropZhCn extends TranslationsCardPropPanelBasicPropEn {
	_TranslationsCardPropPanelBasicPropZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => 'basicProp';
	@override String get cardName => 'Card Name';
	@override late final _TranslationsCardPropPanelBasicPropCardRarityZhCn cardRarity = _TranslationsCardPropPanelBasicPropCardRarityZhCn._(_root);
	@override String get illustrationPath => 'Illustration Path';
}

// Path: cardPropPanel.seasonElementSelect
class _TranslationsCardPropPanelSeasonElementSelectZhCn extends TranslationsCardPropPanelSeasonElementSelectEn {
	_TranslationsCardPropPanelSeasonElementSelectZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => '季语选择';
	@override String get cardCost => '灵力花费';
	@override String get seasonElementRequirement => '季语需求';
}

// Path: cardPropPanel.cardDetail
class _TranslationsCardPropPanelCardDetailZhCn extends TranslationsCardPropPanelCardDetailEn {
	_TranslationsCardPropPanelCardDetailZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Card Detail';
	@override String get cardType => '卡牌类型';
	@override String get cardDescription => '卡牌效果描述';
	@override String get cardKeyWordSetting => '卡牌关键字设置';
	@override String get cardTagSetting => 'Card Tag Setting';
}

// Path: cardPropPanel.basicProp.cardRarity
class _TranslationsCardPropPanelBasicPropCardRarityZhCn extends TranslationsCardPropPanelBasicPropCardRarityEn {
	_TranslationsCardPropPanelBasicPropCardRarityZhCn._(TranslationsZhCn root) : this._root = root, super.internal(root);

	final TranslationsZhCn _root; // ignore: unused_field

	// Translations
	@override String get normal => 'normal';
	@override String get unusual => 'unusual';
	@override String get rare => 'rare';
	@override String get treasure => 'treasure';
}

/// The flat map containing all translations for locale <zh-CN>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsZhCn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => '东方灵麟棋卡牌模板生成器',
			'cardPropPanel.name' => 'Card Properties Panel',
			'cardPropPanel.basicProp.name' => 'basicProp',
			'cardPropPanel.basicProp.cardName' => 'Card Name',
			'cardPropPanel.basicProp.cardRarity.normal' => 'normal',
			'cardPropPanel.basicProp.cardRarity.unusual' => 'unusual',
			'cardPropPanel.basicProp.cardRarity.rare' => 'rare',
			'cardPropPanel.basicProp.cardRarity.treasure' => 'treasure',
			'cardPropPanel.basicProp.illustrationPath' => 'Illustration Path',
			'cardPropPanel.seasonElementSelect.name' => '季语选择',
			'cardPropPanel.seasonElementSelect.cardCost' => '灵力花费',
			'cardPropPanel.seasonElementSelect.seasonElementRequirement' => '季语需求',
			'cardPropPanel.cardDetail.name' => 'Card Detail',
			'cardPropPanel.cardDetail.cardType' => '卡牌类型',
			'cardPropPanel.cardDetail.cardDescription' => '卡牌效果描述',
			'cardPropPanel.cardDetail.cardKeyWordSetting' => '卡牌关键字设置',
			'cardPropPanel.cardDetail.cardTagSetting' => 'Card Tag Setting',
			_ => null,
		};
	}
}
