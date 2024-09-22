
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:sintez_test/modules/navigation/constants/routes.dart';

part 'shell_navigation_vm.g.dart';

class ShellNavigationViewModel = _ShellNavigationViewModel
    with _$ShellNavigationViewModel;

abstract class _ShellNavigationViewModel with Store {
  final GoRouter router;

  _ShellNavigationViewModel({required this.router});

  void openPage1() {
    router.go(RoutePath.feed);
  }

  void openPage2() {
    router.go(RoutePath.readPost);
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }
  void closeDrawer(BuildContext context) {
    Scaffold.of(context).closeDrawer();
  }
}