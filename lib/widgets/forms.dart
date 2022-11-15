import 'package:flutter/material.dart';
import 'package:test_suitmedia/shared/styles.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.hint,
    this.controller,
    this.enable = true,
  }) : super(key: key);
  final String hint;

  final TextEditingController? controller;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enable,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        hintText: hint,
        hintStyle: greyTextStyle.copyWith(
          fontSize: 16,
          fontWeight: regular,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
