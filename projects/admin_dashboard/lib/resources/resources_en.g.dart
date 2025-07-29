///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'resources.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final resource = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	/// [AppLocaleUtils.buildWithOverrides] is recommended for overriding.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: $meta = meta ?? TranslationMetadata(
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
	late final TranslationsApplicationConfigEn application_config = TranslationsApplicationConfigEn._(_root);
	late final TranslationsViewsEn views = TranslationsViewsEn._(_root);
}

// Path: application_config
class TranslationsApplicationConfigEn {
	TranslationsApplicationConfigEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get app_name => TranslationOverrides.string(_root.$meta, 'application_config.app_name', {}) ?? 'Dashboard';
	String get app_version => TranslationOverrides.string(_root.$meta, 'application_config.app_version', {}) ?? '1.0.0';
}

// Path: views
class TranslationsViewsEn {
	TranslationsViewsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsViewsSplashEn splash = TranslationsViewsSplashEn._(_root);
	late final TranslationsViewsOnboardingEn onboarding = TranslationsViewsOnboardingEn._(_root);
}

// Path: views.splash
class TranslationsViewsSplashEn {
	TranslationsViewsSplashEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get made_by => TranslationOverrides.string(_root.$meta, 'views.splash.made_by', {}) ?? 'Made by';
	String get mf => TranslationOverrides.string(_root.$meta, 'views.splash.mf', {}) ?? 'MasterFabric';
}

// Path: views.onboarding
class TranslationsViewsOnboardingEn {
	TranslationsViewsOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsViewsOnboardingPage1En page1 = TranslationsViewsOnboardingPage1En._(_root);
	late final TranslationsViewsOnboardingPage2En page2 = TranslationsViewsOnboardingPage2En._(_root);
	late final TranslationsViewsOnboardingPage3En page3 = TranslationsViewsOnboardingPage3En._(_root);
	String get skip => TranslationOverrides.string(_root.$meta, 'views.onboarding.skip', {}) ?? 'Skip';
	String get back => TranslationOverrides.string(_root.$meta, 'views.onboarding.back', {}) ?? 'Back';
	String get loading => TranslationOverrides.string(_root.$meta, 'views.onboarding.loading', {}) ?? 'Loading...';
	String get error_title => TranslationOverrides.string(_root.$meta, 'views.onboarding.error_title', {}) ?? 'Something went wrong!';
	String get done => TranslationOverrides.string(_root.$meta, 'views.onboarding.done', {}) ?? 'done';
	String get next => TranslationOverrides.string(_root.$meta, 'views.onboarding.next', {}) ?? 'next';
	String get retry => TranslationOverrides.string(_root.$meta, 'views.onboarding.retry', {}) ?? 'Retry';
	String get completed => TranslationOverrides.string(_root.$meta, 'views.onboarding.completed', {}) ?? 'Onboarding completed!';
	String get redirecting => TranslationOverrides.string(_root.$meta, 'views.onboarding.redirecting', {}) ?? 'Redirecting to dashboard...';
	String get image_missing => TranslationOverrides.string(_root.$meta, 'views.onboarding.image_missing', {}) ?? 'Image missing';
}

// Path: views.onboarding.page1
class TranslationsViewsOnboardingPage1En {
	TranslationsViewsOnboardingPage1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => TranslationOverrides.string(_root.$meta, 'views.onboarding.page1.title', {}) ?? 'Welcome to OSMEA!';
	String get description => TranslationOverrides.string(_root.$meta, 'views.onboarding.page1.description', {}) ?? 'OSMEA Dashboard helps you manage your store efficiently from products to orders and analytics so you can stay in control and focus on growth.';
	String get button_text => TranslationOverrides.string(_root.$meta, 'views.onboarding.page1.button_text', {}) ?? 'Next';
}

// Path: views.onboarding.page2
class TranslationsViewsOnboardingPage2En {
	TranslationsViewsOnboardingPage2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => TranslationOverrides.string(_root.$meta, 'views.onboarding.page2.title', {}) ?? 'Manage With Ease';
	String get description => TranslationOverrides.string(_root.$meta, 'views.onboarding.page2.description', {}) ?? 'OSMEA Dashboard streamlines store management from listings to orders giving you full control and the freedom to grow your mobile commerce business.';
	String get button_text => TranslationOverrides.string(_root.$meta, 'views.onboarding.page2.button_text', {}) ?? 'Next';
}

// Path: views.onboarding.page3
class TranslationsViewsOnboardingPage3En {
	TranslationsViewsOnboardingPage3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => TranslationOverrides.string(_root.$meta, 'views.onboarding.page3.title', {}) ?? 'Built for Scale and Simplicity';
	String get description => TranslationOverrides.string(_root.$meta, 'views.onboarding.page3.description', {}) ?? 'OSMEA Dashboard scales with your business, delivering smart, secure tools to manage any number of storefronts efficiently and on brand.';
	String get button_text => TranslationOverrides.string(_root.$meta, 'views.onboarding.page3.button_text', {}) ?? 'Done';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'application_config.app_name': return TranslationOverrides.string(_root.$meta, 'application_config.app_name', {}) ?? 'Dashboard';
			case 'application_config.app_version': return TranslationOverrides.string(_root.$meta, 'application_config.app_version', {}) ?? '1.0.0';
			case 'views.splash.made_by': return TranslationOverrides.string(_root.$meta, 'views.splash.made_by', {}) ?? 'Made by';
			case 'views.splash.mf': return TranslationOverrides.string(_root.$meta, 'views.splash.mf', {}) ?? 'MasterFabric';
			case 'views.onboarding.page1.title': return TranslationOverrides.string(_root.$meta, 'views.onboarding.page1.title', {}) ?? 'Welcome to OSMEA!';
			case 'views.onboarding.page1.description': return TranslationOverrides.string(_root.$meta, 'views.onboarding.page1.description', {}) ?? 'OSMEA Dashboard helps you manage your store efficiently from products to orders and analytics so you can stay in control and focus on growth.';
			case 'views.onboarding.page1.button_text': return TranslationOverrides.string(_root.$meta, 'views.onboarding.page1.button_text', {}) ?? 'Next';
			case 'views.onboarding.page2.title': return TranslationOverrides.string(_root.$meta, 'views.onboarding.page2.title', {}) ?? 'Manage With Ease';
			case 'views.onboarding.page2.description': return TranslationOverrides.string(_root.$meta, 'views.onboarding.page2.description', {}) ?? 'OSMEA Dashboard streamlines store management from listings to orders giving you full control and the freedom to grow your mobile commerce business.';
			case 'views.onboarding.page2.button_text': return TranslationOverrides.string(_root.$meta, 'views.onboarding.page2.button_text', {}) ?? 'Next';
			case 'views.onboarding.page3.title': return TranslationOverrides.string(_root.$meta, 'views.onboarding.page3.title', {}) ?? 'Built for Scale and Simplicity';
			case 'views.onboarding.page3.description': return TranslationOverrides.string(_root.$meta, 'views.onboarding.page3.description', {}) ?? 'OSMEA Dashboard scales with your business, delivering smart, secure tools to manage any number of storefronts efficiently and on brand.';
			case 'views.onboarding.page3.button_text': return TranslationOverrides.string(_root.$meta, 'views.onboarding.page3.button_text', {}) ?? 'Done';
			case 'views.onboarding.skip': return TranslationOverrides.string(_root.$meta, 'views.onboarding.skip', {}) ?? 'Skip';
			case 'views.onboarding.back': return TranslationOverrides.string(_root.$meta, 'views.onboarding.back', {}) ?? 'Back';
			case 'views.onboarding.loading': return TranslationOverrides.string(_root.$meta, 'views.onboarding.loading', {}) ?? 'Loading...';
			case 'views.onboarding.error_title': return TranslationOverrides.string(_root.$meta, 'views.onboarding.error_title', {}) ?? 'Something went wrong!';
			case 'views.onboarding.done': return TranslationOverrides.string(_root.$meta, 'views.onboarding.done', {}) ?? 'done';
			case 'views.onboarding.next': return TranslationOverrides.string(_root.$meta, 'views.onboarding.next', {}) ?? 'next';
			case 'views.onboarding.retry': return TranslationOverrides.string(_root.$meta, 'views.onboarding.retry', {}) ?? 'Retry';
			case 'views.onboarding.completed': return TranslationOverrides.string(_root.$meta, 'views.onboarding.completed', {}) ?? 'Onboarding completed!';
			case 'views.onboarding.redirecting': return TranslationOverrides.string(_root.$meta, 'views.onboarding.redirecting', {}) ?? 'Redirecting to dashboard...';
			case 'views.onboarding.image_missing': return TranslationOverrides.string(_root.$meta, 'views.onboarding.image_missing', {}) ?? 'Image missing';
			default: return null;
		}
	}
}

