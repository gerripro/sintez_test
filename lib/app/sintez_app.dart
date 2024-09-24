import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sintez_test/modules/navigation/router/navigation_register_module.dart';
import 'package:sintez_test/modules/theme/stores/theme_store.dart';

class SintezApp extends StatelessWidget {
  final ThemeStore themeStore;
  final SintezAppRouter sintezAppRouter;

  const SintezApp(
      {super.key, required this.sintezAppRouter, required this.themeStore});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return MaterialApp.router(
        title: 'Flutter Demo',
        theme: themeStore.currentTheme.theme,
        // ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        routerConfig: sintezAppRouter.router,
      );
    });
  }
}
