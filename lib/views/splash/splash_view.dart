import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: AppLogo(),
        ),
      );
}
