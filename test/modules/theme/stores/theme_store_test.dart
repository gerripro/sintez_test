import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/modules/theme/enums/app_theme.dart';
import 'package:sintez_test/modules/theme/stores/theme_store.dart';

import '../../../mocks.dart';

void main() {
  late MockThemeRepository mockThemeRepository;
  late ThemeStore themeStore;

  void initStoreWithTheme({AppTheme? appTheme}) {
    mockThemeRepository = MockThemeRepository();
    when(() => mockThemeRepository.getThemeMode())
        .thenAnswer((_) => appTheme?.string);

    themeStore = ThemeStore(themeRepository: mockThemeRepository);
  }

  test(
      'should call get theme mode from repository '
      'on initialization ', () async {
    initStoreWithTheme();

    await Future.delayed(Duration.zero);

    verify(() => mockThemeRepository.getThemeMode()).called(1);
  });

  test(
      'should have current theme light '
      'on initialization '
      'if theme was never set before ', () async {
    initStoreWithTheme(appTheme: null);

    await Future.delayed(Duration.zero);

    expect(themeStore.currentTheme, AppTheme.light);
  });

  test(
      'should have current theme dark '
      'on initialization '
      'if theme was set to dark previously ', () async {
    initStoreWithTheme(appTheme: AppTheme.dark);

    await Future.delayed(Duration.zero);

    expect(themeStore.currentTheme, AppTheme.dark);
  });

  test(
      'should change theme to dark '
      'when dark theme os passed to set theme mode', () async {
    initStoreWithTheme(appTheme: AppTheme.light);
    when(() => mockThemeRepository.setThemeMode(value: any(named: 'value')))
        .thenAnswer((_) async {});
    AppTheme desiredTheme = AppTheme.dark;
    when(() => mockThemeRepository.getThemeMode())
        .thenAnswer((_) => desiredTheme.string);

    await themeStore.setThemeMode(themeMode: desiredTheme);

    expect(themeStore.currentTheme, desiredTheme);
  });
}
