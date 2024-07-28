import 'package:e_shop/providers/providers.dart';
import 'package:e_shop/res/res.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:e_shop/views/views.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
              key: provider.signupFormKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputField(
                    controller: provider.nameTEC,
                    label: 'Name',
                    validator: AppValidators.userName,
                    textInputType: TextInputType.name,
                  ),
                  const SizedBox(height: 12),
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
                onTap: provider.signup,
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
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = provider.goToLogin,
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
