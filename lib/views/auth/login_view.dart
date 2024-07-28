import 'package:e_shop/providers/providers.dart';
import 'package:e_shop/res/res.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:e_shop/views/views.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.read<AuthProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        title: const AppLogo(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Spacer(),
            Form(
              key: provider.loginFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: const ValueKey('email-field'),
                    child: InputField(
                      controller: provider.emailTEC,
                      label: 'Email',
                      validator: AppValidators.emailValidator,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const PasswordField(),
                ],
              ),
            ),
            const Spacer(),
            Hero(
              tag: const ValueKey('primary-button'),
              child: AppButton(
                onTap: provider.login,
                label: 'Login',
              ),
            ),
            const SizedBox(height: 8),
            Hero(
              tag: const ValueKey('secondary-button'),
              child: RichText(
                text: TextSpan(
                  text: 'New here? ',
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Signup',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = provider.goToSignup,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
