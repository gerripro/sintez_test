import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sintez_test/modules/theme/repositories/theme_repository.dart';

import '../../../mocks.dart';

void main() {
  late MockSharedPreferencesWrapper mockSharedPreferencesWrapper;
  late ThemeRepository repository;

  setUpAll(() {
    mockSharedPreferencesWrapper = MockSharedPreferencesWrapper();
    repository = ThemeRepository(mockSharedPreferencesWrapper);
  });
  const key = 'theme';

  test(
      'should call setString of shared prefs '
      'on setThemeMode ', () async {
    when(() => mockSharedPreferencesWrapper.setString(
        key: key, value: any(named: 'value'))).thenAnswer((_) async => true);

    repository.setThemeMode(value: 'new theme');

    verify(() => mockSharedPreferencesWrapper.setString(
          key: key,
          value: 'new theme',
        )).called(1);
  });

  test(
      'should call getString of shared prefs '
      'on getThemeMode ', () async {
    when(() => mockSharedPreferencesWrapper.getStringByKey(key))
        .thenAnswer((_) => 'true');

    repository.getThemeMode();

    verify(() => mockSharedPreferencesWrapper.getStringByKey(key)).called(1);
  });
}
