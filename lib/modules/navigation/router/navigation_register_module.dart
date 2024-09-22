import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:sintez_test/modules/navigation/constants/routes.dart';
import 'package:sintez_test/modules/navigation/view_models/shell_navigation_vm.dart';
import 'package:sintez_test/modules/navigation/widgets/shell_navigation_page.dart';

part "app_router.dart";

class SintezAppRouter {
  final GoRouter router;
  const SintezAppRouter({required this.router});
}

@module
abstract class AppRouterRegistrationModule {
  @lazySingleton
  SintezAppRouter get appRouter => SintezAppRouter(router: _router);
}