import 'package:e_shop/data/data.dart';
import 'package:e_shop/di/di.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Utility.updateLater(() {
      final isLoggedIn = kGetIt<DbClient>().get<bool>(LocalKeys.isLoggedIn, defaultValue: false);
      if (isLoggedIn) {
        RouteManagement.goToDashboard();
      } else {
        RouteManagement.goToLogin();
      }
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: AppLogo(),
        ),
      );
}
