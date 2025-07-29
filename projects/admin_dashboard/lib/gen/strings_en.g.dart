///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
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
	late final TranslationsApplicationConfigEn application_config = TranslationsApplicationConfigEn._(_root);
	late final TranslationsViewsEn views = TranslationsViewsEn._(_root);
}

// Path: application_config
class TranslationsApplicationConfigEn {
	TranslationsApplicationConfigEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get app_name => 'Dashboard';
	String get app_version => '1.0.0';
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
	String get made_by => 'Made by';
	String get mf => 'MasterFabric';
}

// Path: views.onboarding
class TranslationsViewsOnboardingEn {
	TranslationsViewsOnboardingEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsViewsOnboardingPage1En page1 = TranslationsViewsOnboardingPage1En._(_root);
	late final TranslationsViewsOnboardingPage2En page2 = TranslationsViewsOnboardingPage2En._(_root);
	late final TranslationsViewsOnboardingPage3En page3 = TranslationsViewsOnboardingPage3En._(_root);
	String get skip => 'Skip';
	String get back => 'Back';
	String get loading => 'Loading...';
	String get error_title => 'Something went wrong!';
	String get done => 'done';
	String get next => 'next';
	String get retry => 'Retry';
	String get completed => 'Onboarding completed!';
	String get redirecting => 'Redirecting to dashboard...';
	String get image_missing => 'Image missing';
}

// Path: views.onboarding.page1
class TranslationsViewsOnboardingPage1En {
	TranslationsViewsOnboardingPage1En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Welcome to OSMEA!';
	String get description => 'OSMEA Dashboard helps you manage your store efficiently from products to orders and analytics so you can stay in control and focus on growth.';
	String get button_text => 'Next';
}

// Path: views.onboarding.page2
class TranslationsViewsOnboardingPage2En {
	TranslationsViewsOnboardingPage2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Manage With Ease';
	String get description => 'OSMEA Dashboard streamlines store management from listings to orders giving you full control and the freedom to grow your mobile commerce business.';
	String get button_text => 'Next';
}

// Path: views.onboarding.page3
class TranslationsViewsOnboardingPage3En {
	TranslationsViewsOnboardingPage3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Built for Scale and Simplicity';
	String get description => 'OSMEA Dashboard scales with your business, delivering smart, secure tools to manage any number of storefronts efficiently and on brand.';
	String get button_text => 'Done';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'application_config.app_name': return 'Dashboard';
			case 'application_config.app_version': return '1.0.0';
			case 'views.splash.made_by': return 'Made by';
			case 'views.splash.mf': return 'MasterFabric';
			case 'views.onboarding.page1.title': return 'Welcome to OSMEA!';
			case 'views.onboarding.page1.description': return 'OSMEA Dashboard helps you manage your store efficiently from products to orders and analytics so you can stay in control and focus on growth.';
			case 'views.onboarding.page1.button_text': return 'Next';
			case 'views.onboarding.page2.title': return 'Manage With Ease';
			case 'views.onboarding.page2.description': return 'OSMEA Dashboard streamlines store management from listings to orders giving you full control and the freedom to grow your mobile commerce business.';
			case 'views.onboarding.page2.button_text': return 'Next';
			case 'views.onboarding.page3.title': return 'Built for Scale and Simplicity';
			case 'views.onboarding.page3.description': return 'OSMEA Dashboard scales with your business, delivering smart, secure tools to manage any number of storefronts efficiently and on brand.';
			case 'views.onboarding.page3.button_text': return 'Done';
			case 'views.onboarding.skip': return 'Skip';
			case 'views.onboarding.back': return 'Back';
			case 'views.onboarding.loading': return 'Loading...';
			case 'views.onboarding.error_title': return 'Something went wrong!';
			case 'views.onboarding.done': return 'done';
			case 'views.onboarding.next': return 'next';
			case 'views.onboarding.retry': return 'Retry';
			case 'views.onboarding.completed': return 'Onboarding completed!';
			case 'views.onboarding.redirecting': return 'Redirecting to dashboard...';
			case 'views.onboarding.image_missing': return 'Image missing';
			default: return null;
		}
	}
}

