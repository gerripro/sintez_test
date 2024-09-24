import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sintez_test/modules/navigation/view_models/shell_navigation_vm.dart';
import 'package:sintez_test/shared/constants/spacings.dart';

class ShellNavigationPage extends StatelessWidget {
  final ShellNavigationViewModel viewModel;
  final Widget child;

  const ShellNavigationPage(
      {Key? key, required this.viewModel, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Observer(builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(Spacings.medium),
              child: Switch(
                value: viewModel.switchValue,
                onChanged: (value) {
                  viewModel.switchTheme();
                },
              ),
            );
          }),
        ],
      ),
      body: child,
    );
  }
}
