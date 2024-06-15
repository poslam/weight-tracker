/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 60 (30 per locale)
///
/// Built on 2024-06-15 at 01:33 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
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

	// Translations
	late final _StringsCategoryEn category = _StringsCategoryEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsTaskEn task = _StringsTaskEn._(_root);
}

// Path: category
class _StringsCategoryEn {
	_StringsCategoryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get categoryList => 'category list';
	String get noCategory => 'no category :(';
	String get inputName => 'Enter the category name';
	String get editName => 'Edit the category name';
	String get categoryName => 'Category name';
	String get alreadyExists => 'This category already exists';
	String get notFound => 'This category does not exist';
	String get addCategory => 'New category';
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get add => 'Add';
	String get validInput => 'Field should not be empty';
	String get cancel => 'Cancel';
	String get delete => 'Delete';
	String get confirmDeletion => 'Confirm deletion';
	String get confirm => 'Confirm';
	String get send => 'Send';
}

// Path: task
class _StringsTaskEn {
	_StringsTaskEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get setFilter => 'Set filter';
	String get allTasks => 'All tasks';
	String get completedTasks => 'Completed tasks';
	String get uncompletedTasks => 'Uncompleted tasks';
	String get favouriteTasks => 'Favorite tasks';
	String get taskName => 'Task name';
	String get taskDescription => 'Task description';
	String get confirm => 'Confirm';
	String get createdAt => 'Created at';
	String get notFound => 'This task does not exist';
	String get alreadyExists => 'This task already exists';
	String get noTasks => 'no tasks :/';
	String get task => 'task';
	String get inputPhotoName => 'Input photo name';
	String get noImgs => 'No images found';
}

// Path: <root>
class _StringsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsCategoryRu category = _StringsCategoryRu._(_root);
	@override late final _StringsCommonRu common = _StringsCommonRu._(_root);
	@override late final _StringsTaskRu task = _StringsTaskRu._(_root);
}

// Path: category
class _StringsCategoryRu implements _StringsCategoryEn {
	_StringsCategoryRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get categoryList => 'список категорий';
	@override String get noCategory => 'нет категорий :(';
	@override String get inputName => 'Введите название категории';
	@override String get editName => 'Измените название категории';
	@override String get categoryName => 'Название категории';
	@override String get alreadyExists => 'Такая категория уже существует';
	@override String get notFound => 'Такой категории не существует';
	@override String get addCategory => 'Новая категория';
}

// Path: common
class _StringsCommonRu implements _StringsCommonEn {
	_StringsCommonRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get add => 'Добавить';
	@override String get validInput => 'Поле не должно быть пустым';
	@override String get cancel => 'Отменить';
	@override String get delete => 'Удалить';
	@override String get confirmDeletion => 'Подтвердите удаление';
	@override String get confirm => 'Подтвердить';
	@override String get send => 'Отправить';
}

// Path: task
class _StringsTaskRu implements _StringsTaskEn {
	_StringsTaskRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get setFilter => 'Установить фильтр';
	@override String get allTasks => 'Все задачи';
	@override String get completedTasks => 'Завершенные задачи';
	@override String get uncompletedTasks => 'Незавершенные задачи';
	@override String get favouriteTasks => 'Избранные задачи';
	@override String get taskName => 'Название задачи';
	@override String get taskDescription => 'Описание задачи';
	@override String get confirm => 'Подтвердить';
	@override String get createdAt => 'Создано';
	@override String get notFound => 'Такой задачи не существует';
	@override String get alreadyExists => 'Такая задача уже существует';
	@override String get noTasks => 'нет задач :/';
	@override String get task => 'задача';
	@override String get inputPhotoName => 'Введите название фото';
	@override String get noImgs => 'Фотографии не найдены';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'category.categoryList': return 'category list';
			case 'category.noCategory': return 'no category :(';
			case 'category.inputName': return 'Enter the category name';
			case 'category.editName': return 'Edit the category name';
			case 'category.categoryName': return 'Category name';
			case 'category.alreadyExists': return 'This category already exists';
			case 'category.notFound': return 'This category does not exist';
			case 'category.addCategory': return 'New category';
			case 'common.add': return 'Add';
			case 'common.validInput': return 'Field should not be empty';
			case 'common.cancel': return 'Cancel';
			case 'common.delete': return 'Delete';
			case 'common.confirmDeletion': return 'Confirm deletion';
			case 'common.confirm': return 'Confirm';
			case 'common.send': return 'Send';
			case 'task.setFilter': return 'Set filter';
			case 'task.allTasks': return 'All tasks';
			case 'task.completedTasks': return 'Completed tasks';
			case 'task.uncompletedTasks': return 'Uncompleted tasks';
			case 'task.favouriteTasks': return 'Favorite tasks';
			case 'task.taskName': return 'Task name';
			case 'task.taskDescription': return 'Task description';
			case 'task.confirm': return 'Confirm';
			case 'task.createdAt': return 'Created at';
			case 'task.notFound': return 'This task does not exist';
			case 'task.alreadyExists': return 'This task already exists';
			case 'task.noTasks': return 'no tasks :/';
			case 'task.task': return 'task';
			case 'task.inputPhotoName': return 'Input photo name';
			case 'task.noImgs': return 'No images found';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'category.categoryList': return 'список категорий';
			case 'category.noCategory': return 'нет категорий :(';
			case 'category.inputName': return 'Введите название категории';
			case 'category.editName': return 'Измените название категории';
			case 'category.categoryName': return 'Название категории';
			case 'category.alreadyExists': return 'Такая категория уже существует';
			case 'category.notFound': return 'Такой категории не существует';
			case 'category.addCategory': return 'Новая категория';
			case 'common.add': return 'Добавить';
			case 'common.validInput': return 'Поле не должно быть пустым';
			case 'common.cancel': return 'Отменить';
			case 'common.delete': return 'Удалить';
			case 'common.confirmDeletion': return 'Подтвердите удаление';
			case 'common.confirm': return 'Подтвердить';
			case 'common.send': return 'Отправить';
			case 'task.setFilter': return 'Установить фильтр';
			case 'task.allTasks': return 'Все задачи';
			case 'task.completedTasks': return 'Завершенные задачи';
			case 'task.uncompletedTasks': return 'Незавершенные задачи';
			case 'task.favouriteTasks': return 'Избранные задачи';
			case 'task.taskName': return 'Название задачи';
			case 'task.taskDescription': return 'Описание задачи';
			case 'task.confirm': return 'Подтвердить';
			case 'task.createdAt': return 'Создано';
			case 'task.notFound': return 'Такой задачи не существует';
			case 'task.alreadyExists': return 'Такая задача уже существует';
			case 'task.noTasks': return 'нет задач :/';
			case 'task.task': return 'задача';
			case 'task.inputPhotoName': return 'Введите название фото';
			case 'task.noImgs': return 'Фотографии не найдены';
			default: return null;
		}
	}
}
