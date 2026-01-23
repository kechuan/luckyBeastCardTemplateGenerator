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

	/// en: 'Card Properties Panel'
	String get cardPropPanel => 'Card Properties Panel';

	/// en: 'Season ElementSelect'
	String get seasonElementSelect => 'Season ElementSelect';

	/// en: 'Card Cost'
	String get cardCost => 'Card Cost';

	/// en: 'season Element Requirement'
	String get seasonElementRequirement => 'season Element Requirement';

	/// en: 'Card Type'
	String get cardType => 'Card Type';

	/// en: 'card Rarity'
	String get cardRarity => 'card Rarity';

	/// en: 'Card Description'
	String get cardDescription => 'Card Description';

	/// en: 'Card KeyWord Setting'
	String get cardKeyWordSetting => 'Card KeyWord Setting';

	/// en: 'Lucky Beasts Card Template Generator'
	String get appTitle => 'Lucky Beasts Card Template Generator';

	/// en: 'Setting Panel'
	String get settingPanel => 'Setting Panel';

	/// en: 'Navigation'
	String get navigation => 'Navigation';

	/// en: 'Image Import'
	String get imageImport => 'Image Import';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'cardPropPanel' => 'Card Properties Panel',
			'seasonElementSelect' => 'Season ElementSelect',
			'cardCost' => 'Card Cost',
			'seasonElementRequirement' => 'season Element Requirement',
			'cardType' => 'Card Type',
			'cardRarity' => 'card Rarity',
			'cardDescription' => 'Card Description',
			'cardKeyWordSetting' => 'Card KeyWord Setting',
			'appTitle' => 'Lucky Beasts Card Template Generator',
			'settingPanel' => 'Setting Panel',
			'navigation' => 'Navigation',
			'imageImport' => 'Image Import',
			_ => null,
		};
	}
}
