///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'Lucky Beasts Card Template Generator'
	String get appTitle => 'Lucky Beasts Card Template Generator';

	/// en: 'Setting Panel'
	String get settingPanel => 'Setting Panel';

	/// en: 'Navigation'
	String get navigation => 'Navigation';

	/// en: 'Image Import'
	String get imageImport => 'Image Import';

	late final TranslationsCardPropPanelEn cardPropPanel = TranslationsCardPropPanelEn.internal(_root);
}

// Path: cardPropPanel
class TranslationsCardPropPanelEn {
	TranslationsCardPropPanelEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Card Properties Panel'
	String get name => 'Card Properties Panel';

	late final TranslationsCardPropPanelBasicPropEn basicProp = TranslationsCardPropPanelBasicPropEn.internal(_root);
	late final TranslationsCardPropPanelSeasonElementSelectEn seasonElementSelect = TranslationsCardPropPanelSeasonElementSelectEn.internal(_root);
	late final TranslationsCardPropPanelCardDetailEn cardDetail = TranslationsCardPropPanelCardDetailEn.internal(_root);
}

// Path: cardPropPanel.basicProp
class TranslationsCardPropPanelBasicPropEn {
	TranslationsCardPropPanelBasicPropEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'BasicProp'
	String get name => 'BasicProp';

	/// en: 'Card Name'
	String get cardName => 'Card Name';

	late final TranslationsCardPropPanelBasicPropCardRarityEn cardRarity = TranslationsCardPropPanelBasicPropCardRarityEn.internal(_root);

	/// en: 'Illustration Path'
	String get illustrationPath => 'Illustration Path';
}

// Path: cardPropPanel.seasonElementSelect
class TranslationsCardPropPanelSeasonElementSelectEn {
	TranslationsCardPropPanelSeasonElementSelectEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Season ElementSelect'
	String get name => 'Season ElementSelect';

	/// en: 'Card Cost'
	String get cardCost => 'Card Cost';

	/// en: 'Season Element Requirement'
	String get seasonElementRequirement => 'Season Element Requirement';
}

// Path: cardPropPanel.cardDetail
class TranslationsCardPropPanelCardDetailEn {
	TranslationsCardPropPanelCardDetailEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Card Detail'
	String get name => 'Card Detail';

	/// en: 'Card Type'
	String get cardType => 'Card Type';

	/// en: 'Card Description'
	String get cardDescription => 'Card Description';

	/// en: 'Card KeyWord Setting'
	String get cardKeyWordSetting => 'Card KeyWord Setting';

	/// en: 'Card Tag Setting'
	String get cardTagSetting => 'Card Tag Setting';
}

// Path: cardPropPanel.basicProp.cardRarity
class TranslationsCardPropPanelBasicPropCardRarityEn {
	TranslationsCardPropPanelBasicPropCardRarityEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'cardRarity'
	String get name => 'cardRarity';

	/// en: 'Normal'
	String get normal => 'Normal';

	/// en: 'Unusual'
	String get unusual => 'Unusual';

	/// en: 'Rare'
	String get rare => 'Rare';

	/// en: 'Mythic'
	String get mythic => 'Mythic';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => 'Lucky Beasts Card Template Generator',
			'settingPanel' => 'Setting Panel',
			'navigation' => 'Navigation',
			'imageImport' => 'Image Import',
			'cardPropPanel.name' => 'Card Properties Panel',
			'cardPropPanel.basicProp.name' => 'BasicProp',
			'cardPropPanel.basicProp.cardName' => 'Card Name',
			'cardPropPanel.basicProp.cardRarity.name' => 'cardRarity',
			'cardPropPanel.basicProp.cardRarity.normal' => 'Normal',
			'cardPropPanel.basicProp.cardRarity.unusual' => 'Unusual',
			'cardPropPanel.basicProp.cardRarity.rare' => 'Rare',
			'cardPropPanel.basicProp.cardRarity.mythic' => 'Mythic',
			'cardPropPanel.basicProp.illustrationPath' => 'Illustration Path',
			'cardPropPanel.seasonElementSelect.name' => 'Season ElementSelect',
			'cardPropPanel.seasonElementSelect.cardCost' => 'Card Cost',
			'cardPropPanel.seasonElementSelect.seasonElementRequirement' => 'Season Element Requirement',
			'cardPropPanel.cardDetail.name' => 'Card Detail',
			'cardPropPanel.cardDetail.cardType' => 'Card Type',
			'cardPropPanel.cardDetail.cardDescription' => 'Card Description',
			'cardPropPanel.cardDetail.cardKeyWordSetting' => 'Card KeyWord Setting',
			'cardPropPanel.cardDetail.cardTagSetting' => 'Card Tag Setting',
			_ => null,
		};
	}
}
