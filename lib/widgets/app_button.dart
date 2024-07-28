import 'package:e_shop/res/res.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.label,
  });

  final VoidCallback? onTap;
  final String label;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.maxFinite,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.white,
            textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
            elevation: 0,
          ),
          onPressed: onTap,
          child: Text(
            label,
          ),
        ),
      );
}
