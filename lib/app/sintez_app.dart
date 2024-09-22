import 'package:flutter/material.dart';
import 'package:sintez_test/modules/navigation/router/navigation_register_module.dart';

class SintezApp extends StatelessWidget {
  final SintezAppRouter sintezAppRouter;

  const SintezApp({super.key, required this.sintezAppRouter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: sintezAppRouter.router,
    );
  }
}
