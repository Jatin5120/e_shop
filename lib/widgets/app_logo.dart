import 'package:e_shop/res/res.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  }) : _isPrimary = true;

  const AppLogo.secondary({
    super.key,
  }) : _isPrimary = false;

  final bool _isPrimary;

  @override
  Widget build(BuildContext context) => Hero(
        tag: const ValueKey('app-logo'),
        child: Text(
          'e-shop',
          style: context.textTheme.titleLarge?.copyWith(
            color: _isPrimary ? AppColors.primary : AppColors.white,
          ),
        ),
      );
}
