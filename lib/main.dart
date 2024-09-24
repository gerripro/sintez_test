import 'package:flutter/material.dart';
import 'package:sintez_test/app/DI/ioc.dart';
import 'package:sintez_test/app/sintez_app.dart';
import 'package:sintez_test/modules/navigation/router/navigation_register_module.dart';
import 'package:sintez_test/modules/theme/stores/theme_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(SintezApp(
      themeStore: ioc<ThemeStore>(),
      sintezAppRouter: ioc<SintezAppRouter>()));
}
