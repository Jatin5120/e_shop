import 'package:e_shop/providers/auth_provider.dart';
import 'package:e_shop/res/res.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) => Consumer<AuthProvider>(
        builder: (_, provider, ___) => Hero(
          tag: const ValueKey('password-field'),
          child: InputField(
            controller: provider.passwordTEC,
            label: 'Password',
            validator: AppValidators.passwordValidator,
            textInputType: TextInputType.visiblePassword,
            obscureText: !provider.showPassword,
            suffixIcon: IconButton(
              onPressed: provider.togglePasswordVisibility,
              icon: provider.showPassword
                  ? const Icon(
                      Icons.visibility_outlined,
                      color: AppColors.primary,
                    )
                  : const Icon(
                      Icons.visibility_off_outlined,
                      color: AppColors.primary,
                    ),
            ),
          ),
        ),
      );
}
