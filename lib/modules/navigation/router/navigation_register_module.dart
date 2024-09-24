import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:sintez_test/app/DI/ioc.dart';
import 'package:sintez_test/app/db/sintez_sql_db.dart';
import 'package:sintez_test/modules/feed/dao/likes_dao_sqflite_impl.dart';
import 'package:sintez_test/modules/feed/dao/post_dao_sqflite_impl.dart';
import 'package:sintez_test/modules/feed/repositories/likes_repository.dart';
import 'package:sintez_test/modules/feed/repositories/post_repository.dart';
import 'package:sintez_test/modules/feed/services/likes_service.dart';
import 'package:sintez_test/modules/feed/view_models/feed_page_vm.dart';
import 'package:sintez_test/modules/feed/view_models/post_creation_page_vm.dart';
import 'package:sintez_test/modules/feed/widgets/feed_page.dart';
import 'package:sintez_test/modules/feed/widgets/post_creation_page.dart';
import 'package:sintez_test/modules/media_picker/services/media_handler_service.dart';
import 'package:sintez_test/modules/media_picker/wrappers/gallery_picker_wrapper.dart';
import 'package:sintez_test/modules/navigation/constants/routes.dart';
import 'package:sintez_test/modules/navigation/view_models/shell_navigation_vm.dart';
import 'package:sintez_test/modules/navigation/widgets/shell_navigation_page.dart';
import 'package:sintez_test/modules/theme/stores/theme_store.dart';
import 'package:sintez_test/shared/utils/helpers/uuid_generator.dart';

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