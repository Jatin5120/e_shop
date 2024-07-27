import 'package:e_shop/main.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:go_router/go_router.dart';

class RouteManagement {
  RouteManagement._();

  static void goToLogin() {
    kNavigatorKey.currentContext!.goNamed(RouteNames.login);
  }

  static void goToSignup() {
    kNavigatorKey.currentContext!.goNamed(RouteNames.signup);
  }

  static void goToDashboard() {
    kNavigatorKey.currentContext!.goNamed(RouteNames.dashboard);
  }
}
