
import 'package:flutter/material.dart';
import 'package:sintez_test/shared/constants/spacings.dart';

abstract class SnackBars {
  static void callRegularSnackBar(
      {required BuildContext context, required String text, Key? key}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(_regularSnackbar(key,text));
  }

  static SnackBar _regularSnackbar(Key? key, String text) {
    return SnackBar(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: Spacings.medium),
      elevation: 4,
      content: Text(text),
      showCloseIcon: true,
    );
  }
}