// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStore, Store {
  Computed<AppTheme>? _$currentThemeComputed;

  @override
  AppTheme get currentTheme =>
      (_$currentThemeComputed ??= Computed<AppTheme>(() => super.currentTheme,
              name: '_ThemeStore.currentTheme'))
          .value;

  late final _$_currentThemeAtom =
      Atom(name: '_ThemeStore._currentTheme', context: context);

  @override
  AppTheme get _currentTheme {
    _$_currentThemeAtom.reportRead();
    return super._currentTheme;
  }

  @override
  set _currentTheme(AppTheme value) {
    _$_currentThemeAtom.reportWrite(value, super._currentTheme, () {
      super._currentTheme = value;
    });
  }

  late final _$setThemeModeAsyncAction =
      AsyncAction('_ThemeStore.setThemeMode', context: context);

  @override
  Future<void> setThemeMode({required AppTheme themeMode}) {
    return _$setThemeModeAsyncAction
        .run(() => super.setThemeMode(themeMode: themeMode));
  }

  late final _$_ThemeStoreActionController =
      ActionController(name: '_ThemeStore', context: context);

  @override
  void _updateTheme() {
    final _$actionInfo = _$_ThemeStoreActionController.startAction(
        name: '_ThemeStore._updateTheme');
    try {
      return super._updateTheme();
    } finally {
      _$_ThemeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentTheme: ${currentTheme}
    ''';
  }
}
