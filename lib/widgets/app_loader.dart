import 'package:e_shop/utils/utils.dart';
import 'package:flutter/material.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.isDialog = true,
  });

  final bool isDialog;

  @override
  Widget build(BuildContext context) => Center(
        child: Card(
          elevation: isDialog ? null : 0,
          color: context.theme.cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CircularProgressIndicator(
              color: context.theme.primaryColor,
              strokeWidth: 3,
            ),
          ),
        ),
      );
}
