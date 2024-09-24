import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:sintez_test/modules/theme/enums/app_theme.dart';
import 'package:sintez_test/modules/theme/extensions/app_theme_string_extension.dart';
import 'package:sintez_test/modules/theme/repositories/theme_repository.dart';

part 'theme_store.g.dart';

@lazySingleton
class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  final ThemeRepository themeRepository;

  _ThemeStore({required this.themeRepository}) {
    _updateTheme();
  }

  @action
  Future<void> setThemeMode({required AppTheme themeMode}) async {
    await themeRepository.setThemeMode(value: themeMode.string);
    _updateTheme();
  }
  /// the enum has a link to ThemeData
  @computed
  AppTheme get currentTheme => _currentTheme;

  @observable
  AppTheme _currentTheme = AppTheme.light;

  @action
  void _updateTheme() {
    _currentTheme = themeRepository.getThemeMode()?.appThemeFromString ?? AppTheme.light;
  }
}
