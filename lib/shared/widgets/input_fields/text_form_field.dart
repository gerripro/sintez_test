import 'package:flutter/material.dart';

class STextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function(String?)? onFieldSubmit;
  final String? hint;
  final bool expands;
  final TextInputType? keyboardType;
  final bool enabled;
  final bool obscureText;
  final String? labelText;
  final int? maxLines;
  final int? minLines;

  const STextFormField(
      {Key? key,
      this.controller,
      this.validator,
      this.onFieldSubmit,
      this.hint,
      this.expands = false,
      this.keyboardType,
      this.enabled = true,
      this.obscureText = false,
      this.labelText,
      this.maxLines = 1,
      this.minLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(8));
    return TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        expands: expands,
        enabled: enabled,
        onFieldSubmitted: onFieldSubmit,
        obscureText: obscureText,
        maxLines: maxLines,
        minLines: minLines,
        decoration: InputDecoration(
          hintText: hint,
          alignLabelWithHint: false,
          labelText: labelText,
          isCollapsed: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(), borderRadius: borderRadius),
          errorBorder: const OutlineInputBorder(
              borderRadius: borderRadius, borderSide: BorderSide()),
          errorStyle: const TextStyle(color: Colors.red),
          border: const OutlineInputBorder(
              borderSide: BorderSide(), borderRadius: borderRadius),
        ));
  }
}
