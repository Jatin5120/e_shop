import 'package:e_shop/res/res.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
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
            const Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputField(
                    label: 'Name',
                  ),
                  Hero(
                    tag: ValueKey('email-field'),
                    child: InputField(
                      label: 'Email',
                    ),
                  ),
                  Hero(
                    tag: ValueKey('password-field'),
                    child: InputField(
                      label: 'Password',
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Hero(
              tag: const ValueKey('primary-button'),
              child: AppButton(
                onTap: () {},
                label: 'Signup',
              ),
            ),
            const SizedBox(height: 8),
            Hero(
              tag: const ValueKey('secondary-button'),
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account? ',
                  style: context.textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: 'Login',
                      style: const TextStyle(
                        color: AppColors.primary,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = RouteManagement.goToLogin,
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
