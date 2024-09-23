import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:sintez_test/app/DI/ioc.dart';
import 'package:sintez_test/app/db/sintez_sql_db.dart';
import 'package:sintez_test/modules/feed/dao/post_dao_sqflite_impl.dart';
import 'package:sintez_test/modules/feed/repositories/post_repository.dart';
import 'package:sintez_test/modules/feed/view_models/feed_vm.dart';
import 'package:sintez_test/modules/feed/widgets/feed.dart';
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