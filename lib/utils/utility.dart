import 'package:e_shop/main.dart';
import 'package:e_shop/models/models.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  static void showLoader() {
    showDialog(
      context: kNavigatorKey.currentContext!,
      builder: (_) => const AppLoader(),
      barrierDismissible: false,
    );
  }

  static void closeLoader() {
    kNavigatorKey.currentContext!.pop();
  }

  static Future<void> showInfoDialog(DialogModel dialog) async {
    await showDialog(
      context: kNavigatorKey.currentContext!,
      builder: (_) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (dialog.title != null)
                Text(
                  dialog.title!,
                  style: kNavigatorKey.currentContext!.textTheme.titleLarge,
                ),
              const SizedBox(height: 16),
              Text(
                dialog.data,
                style: kNavigatorKey.currentContext!.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const AppButton(
                label: 'Okay',
                onTap: closeLoader,
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
