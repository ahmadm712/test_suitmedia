import 'package:flutter/material.dart';

import 'package:test_suitmedia/shared/styles.dart';

class MainAppbar extends StatelessWidget {
  const MainAppbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: blackTextStyle.copyWith(
          fontWeight: bold,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(
          Icons.navigate_before,
          size: 30,
          color: kStrongBlueColor,
        ),
      ),
    );
  }
}
