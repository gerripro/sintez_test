import 'package:flutter/material.dart';

class AdaptiveConstraint extends StatelessWidget {
  final Widget child;
  const AdaptiveConstraint({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      alignment: Alignment.centerLeft,
      child: child,
    );
  }
}
