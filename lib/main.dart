import 'package:flutter/material.dart';
import 'package:sintez_test/app/DI/ioc.dart';
import 'package:sintez_test/app/sintez_app.dart';
import 'package:sintez_test/modules/navigation/router/navigation_register_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(SintezApp(sintezAppRouter: ioc<SintezAppRouter>()));
}
