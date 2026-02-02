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

	/// en: 'Lucky Beasts Card Generator'
	String get appTitle => 'Lucky Beasts Card Generator';

	late final TranslationsNavigationPanelEn navigationPanel = TranslationsNavigationPanelEn._(_root);
	late final TranslationsCardPropPanelEn cardPropPanel = TranslationsCardPropPanelEn._(_root);
	late final TranslationsOutputPanelEn outputPanel = TranslationsOutputPanelEn._(_root);
	late final TranslationsSettingPageEn settingPage = TranslationsSettingPageEn._(_root);
}

// Path: navigationPanel
class TranslationsNavigationPanelEn {
	TranslationsNavigationPanelEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Navigation'
	String get name => 'Navigation';

	/// en: 'Card Creator'
	String get palette => 'Card Creator';

	/// en: 'Setting'
	String get setting => 'Setting';

	/// en: 'Export Picture'
	String get exportButton => 'Export Picture';
}

// Path: cardPropPanel
class TranslationsCardPropPanelEn {
	TranslationsCardPropPanelEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Card Properties Panel'
	String get name => 'Card Properties Panel';

	late final TranslationsCardPropPanelIllustrationSelectEn illustrationSelect = TranslationsCardPropPanelIllustrationSelectEn._(_root);
	late final TranslationsCardPropPanelBasicPropEn basicProp = TranslationsCardPropPanelBasicPropEn._(_root);
	late final TranslationsCardPropPanelSeasonElementSelectEn seasonElementSelect = TranslationsCardPropPanelSeasonElementSelectEn._(_root);
	late final TranslationsCardPropPanelCardDetailEn cardDetail = TranslationsCardPropPanelCardDetailEn._(_root);
	late final TranslationsCardPropPanelElementPositionsEn elementPositions = TranslationsCardPropPanelElementPositionsEn._(_root);
}

// Path: outputPanel
class TranslationsOutputPanelEn {
	TranslationsOutputPanelEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Image Export Panel'
	String get name => 'Image Export Panel';

	/// en: 'Click the corner save button to export'
	String get outputTips => 'Click the corner save button to export';

	/// en: 'Recommend Image Scale'
	String get recommendImageScale => 'Recommend Image Scale';

	/// en: 'Custom Size'
	String get customSize => 'Custom Size';

	/// en: 'Width'
	String get width => 'Width';

	/// en: 'Height'
	String get height => 'Height';

	/// en: 'Output Path'
	String get outputPath => 'Output Path';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Export'
	String get ok => 'Export';
}

// Path: settingPage
class TranslationsSettingPageEn {
	TranslationsSettingPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Setting Page'
	String get name => 'Setting Page';

	/// en: 'About'
	String get about => 'About';

	/// en: 'Version'
	String get version => 'Version';

	/// en: 'Game Offical QQ Group'
	String get gameOfficalQQGroup => 'Game Offical QQ Group';

	/// en: 'Author'
	String get author => 'Author';

	/// en: 'Update Check'
	String get updateCheck => 'Update Check';
}

// Path: cardPropPanel.illustrationSelect
class TranslationsCardPropPanelIllustrationSelectEn {
	TranslationsCardPropPanelIllustrationSelectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Illustration Select'
	String get name => 'Illustration Select';

	/// en: 'Drag Image File or Folder to import the resource'
	String get emptyPromptPart => 'Drag Image File or Folder to import the resource';

	/// en: 'Release to import the resource'
	String get dragTip => 'Release to import the resource';

	/// en: 'Unsupported file mimetype'
	String get forbiddenPictureFormatTip => 'Unsupported file mimetype';
}

// Path: cardPropPanel.basicProp
class TranslationsCardPropPanelBasicPropEn {
	TranslationsCardPropPanelBasicPropEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'BasicProp'
	String get name => 'BasicProp';

	/// en: 'Card Name'
	String get cardName => 'Card Name';

	late final TranslationsCardPropPanelBasicPropCardRarityEn cardRarity = TranslationsCardPropPanelBasicPropCardRarityEn._(_root);

	/// en: 'Illustration Path'
	String get illustrationPath => 'Illustration Path';
}

// Path: cardPropPanel.seasonElementSelect
class TranslationsCardPropPanelSeasonElementSelectEn {
	TranslationsCardPropPanelSeasonElementSelectEn._(this._root);

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
	TranslationsCardPropPanelCardDetailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Card Detail'
	String get name => 'Card Detail';

	late final TranslationsCardPropPanelCardDetailCardTypeEn cardType = TranslationsCardPropPanelCardDetailCardTypeEn._(_root);

	/// en: 'Card Tag Setting'
	String get familliarTagSetting => 'Card Tag Setting';

	/// en: 'New'
	String get newFamilliarTag => 'New';

	/// en: 'Click Tag to Remove'
	String get familliarTagPlaceHolder => 'Click Tag to Remove';

	/// en: 'Card Description'
	String get cardDescription => 'Card Description';

	/// en: 'Input Card Description, using '{word}' to declare special action'
	String get cardDescriptionPlaceHolder => 'Input Card Description, using \'{word}\' to declare special action';

	/// en: 'Card KeyWord Setting'
	String get cardKeyWordSetting => 'Card KeyWord Setting';

	late final TranslationsCardPropPanelCardDetailKeyWordDescriptionEn keyWordDescription = TranslationsCardPropPanelCardDetailKeyWordDescriptionEn._(_root);
}

// Path: cardPropPanel.elementPositions
class TranslationsCardPropPanelElementPositionsEn {
	TranslationsCardPropPanelElementPositionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Element Positions'
	String get name => 'Element Positions';

	/// en: 'Display Reference Line'
	String get displayReferenceLine => 'Display Reference Line';

	/// en: 'Element Toggle'
	String get elementToggle => 'Element Toggle';

	/// en: 'Reset Current Element'
	String get resetCurrentElement => 'Reset Current Element';

	late final TranslationsCardPropPanelElementPositionsCardElementPositionTypeEn cardElementPositionType = TranslationsCardPropPanelElementPositionsCardElementPositionTypeEn._(_root);
}

// Path: cardPropPanel.basicProp.cardRarity
class TranslationsCardPropPanelBasicPropCardRarityEn {
	TranslationsCardPropPanelBasicPropCardRarityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Card Rarity'
	String get name => 'Card Rarity';

	/// en: 'Normal'
	String get normal => 'Normal';

	/// en: 'Unusual'
	String get unusual => 'Unusual';

	/// en: 'Rare'
	String get rare => 'Rare';

	/// en: 'Mythic'
	String get mythic => 'Mythic';
}

// Path: cardPropPanel.cardDetail.cardType
class TranslationsCardPropPanelCardDetailCardTypeEn {
	TranslationsCardPropPanelCardDetailCardTypeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Card Type'
	String get name => 'Card Type';

	/// en: 'Familliar'
	String get familliar => 'Familliar';

	/// en: 'SpellCard'
	String get spellcard => 'SpellCard';

	/// en: 'Player'
	String get player => 'Player';

	/// en: 'Construction'
	String get construction => 'Construction';
}

// Path: cardPropPanel.cardDetail.keyWordDescription
class TranslationsCardPropPanelCardDetailKeyWordDescriptionEn {
	TranslationsCardPropPanelCardDetailKeyWordDescriptionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Key Word Description'
	String get name => 'Key Word Description';

	/// en: 'Display KeyWord Description'
	String get displayKeyWordDescription => 'Display KeyWord Description';

	/// en: 'Edit the Keyword to show panel'
	String get placeHolder => 'Edit the Keyword to show panel';
}

// Path: cardPropPanel.elementPositions.cardElementPositionType
class TranslationsCardPropPanelElementPositionsCardElementPositionTypeEn {
	TranslationsCardPropPanelElementPositionsCardElementPositionTypeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'Image'
	String get image => 'Image';

	/// en: 'Mask Layer'
	String get maskLayer => 'Mask Layer';

	/// en: 'Cost'
	String get cost => 'Cost';

	/// en: 'Gem'
	String get gem => 'Gem';

	/// en: 'Season'
	String get seasonRequirement => 'Season';

	/// en: 'Attack'
	String get attack => 'Attack';

	/// en: 'Health'
	String get health => 'Health';

	/// en: 'TypeTag'
	String get typeTag => 'TypeTag';

	/// en: 'Desc'
	String get description => 'Desc';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appTitle' => 'Lucky Beasts Card Generator',
			'navigationPanel.name' => 'Navigation',
			'navigationPanel.palette' => 'Card Creator',
			'navigationPanel.setting' => 'Setting',
			'navigationPanel.exportButton' => 'Export Picture',
			'cardPropPanel.name' => 'Card Properties Panel',
			'cardPropPanel.illustrationSelect.name' => 'Illustration Select',
			'cardPropPanel.illustrationSelect.emptyPromptPart' => 'Drag Image File or Folder to import the resource',
			'cardPropPanel.illustrationSelect.dragTip' => 'Release to import the resource',
			'cardPropPanel.illustrationSelect.forbiddenPictureFormatTip' => 'Unsupported file mimetype',
			'cardPropPanel.basicProp.name' => 'BasicProp',
			'cardPropPanel.basicProp.cardName' => 'Card Name',
			'cardPropPanel.basicProp.cardRarity.name' => 'Card Rarity',
			'cardPropPanel.basicProp.cardRarity.normal' => 'Normal',
			'cardPropPanel.basicProp.cardRarity.unusual' => 'Unusual',
			'cardPropPanel.basicProp.cardRarity.rare' => 'Rare',
			'cardPropPanel.basicProp.cardRarity.mythic' => 'Mythic',
			'cardPropPanel.basicProp.illustrationPath' => 'Illustration Path',
			'cardPropPanel.seasonElementSelect.name' => 'Season ElementSelect',
			'cardPropPanel.seasonElementSelect.cardCost' => 'Card Cost',
			'cardPropPanel.seasonElementSelect.seasonElementRequirement' => 'Season Element Requirement',
			'cardPropPanel.cardDetail.name' => 'Card Detail',
			'cardPropPanel.cardDetail.cardType.name' => 'Card Type',
			'cardPropPanel.cardDetail.cardType.familliar' => 'Familliar',
			'cardPropPanel.cardDetail.cardType.spellcard' => 'SpellCard',
			'cardPropPanel.cardDetail.cardType.player' => 'Player',
			'cardPropPanel.cardDetail.cardType.construction' => 'Construction',
			'cardPropPanel.cardDetail.familliarTagSetting' => 'Card Tag Setting',
			'cardPropPanel.cardDetail.newFamilliarTag' => 'New',
			'cardPropPanel.cardDetail.familliarTagPlaceHolder' => 'Click Tag to Remove',
			'cardPropPanel.cardDetail.cardDescription' => 'Card Description',
			'cardPropPanel.cardDetail.cardDescriptionPlaceHolder' => 'Input Card Description, using \'{word}\' to declare special action',
			'cardPropPanel.cardDetail.cardKeyWordSetting' => 'Card KeyWord Setting',
			'cardPropPanel.cardDetail.keyWordDescription.name' => 'Key Word Description',
			'cardPropPanel.cardDetail.keyWordDescription.displayKeyWordDescription' => 'Display KeyWord Description',
			'cardPropPanel.cardDetail.keyWordDescription.placeHolder' => 'Edit the Keyword to show panel',
			'cardPropPanel.elementPositions.name' => 'Element Positions',
			'cardPropPanel.elementPositions.displayReferenceLine' => 'Display Reference Line',
			'cardPropPanel.elementPositions.elementToggle' => 'Element Toggle',
			'cardPropPanel.elementPositions.resetCurrentElement' => 'Reset Current Element',
			'cardPropPanel.elementPositions.cardElementPositionType.name' => 'Name',
			'cardPropPanel.elementPositions.cardElementPositionType.image' => 'Image',
			'cardPropPanel.elementPositions.cardElementPositionType.maskLayer' => 'Mask Layer',
			'cardPropPanel.elementPositions.cardElementPositionType.cost' => 'Cost',
			'cardPropPanel.elementPositions.cardElementPositionType.gem' => 'Gem',
			'cardPropPanel.elementPositions.cardElementPositionType.seasonRequirement' => 'Season',
			'cardPropPanel.elementPositions.cardElementPositionType.attack' => 'Attack',
			'cardPropPanel.elementPositions.cardElementPositionType.health' => 'Health',
			'cardPropPanel.elementPositions.cardElementPositionType.typeTag' => 'TypeTag',
			'cardPropPanel.elementPositions.cardElementPositionType.description' => 'Desc',
			'outputPanel.name' => 'Image Export Panel',
			'outputPanel.outputTips' => 'Click the corner save button to export',
			'outputPanel.recommendImageScale' => 'Recommend Image Scale',
			'outputPanel.customSize' => 'Custom Size',
			'outputPanel.width' => 'Width',
			'outputPanel.height' => 'Height',
			'outputPanel.outputPath' => 'Output Path',
			'outputPanel.cancel' => 'Cancel',
			'outputPanel.ok' => 'Export',
			'settingPage.name' => 'Setting Page',
			'settingPage.about' => 'About',
			'settingPage.version' => 'Version',
			'settingPage.gameOfficalQQGroup' => 'Game Offical QQ Group',
			'settingPage.author' => 'Author',
			'settingPage.updateCheck' => 'Update Check',
			_ => null,
		};
	}
}
