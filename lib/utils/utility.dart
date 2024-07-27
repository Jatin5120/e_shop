import 'package:e_shop/main.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Utility {
  const Utility._();

  static void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

  static void updateLater(VoidCallback callback, [bool addDelay = true]) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(addDelay ? const Duration(milliseconds: 10) : Duration.zero, () {
        callback();
      });
    });
  }

  /// Show loader
  static void showLoader() {
    showDialog(
      context: kNavigatorKey.currentContext!,
      builder: (_) => const AppLoader(),
      barrierDismissible: false,
    );
  }

  /// Close any open dialog.
  static void closeLoader() {
    kNavigatorKey.currentContext!;
  }
}
