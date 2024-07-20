import 'package:flutter/material.dart';

class AppSnackbar {
  static void showSnackabar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(content)),
      );
  }
}
