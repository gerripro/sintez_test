import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sintez_test/modules/navigation/view_models/shell_navigation_vm.dart';

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
        leading: Observer(builder: (context) {
          return IconButton(
            onPressed: () {
              viewModel.openDrawer(context);
            },
            icon: Icon(Icons.menu),
          );
        }),
      ),
      drawer: Drawer(
        elevation: 0,
        shape: const RoundedRectangleBorder(),
        child: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => viewModel.openPage1(),
                      child: Text("page1"),
                    ),
                    InkWell(
                      onTap: () => viewModel.openPage2(),
                      child: Text("page2"),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: child,
    );
  }
}
