part of 'app_router.dart';

class AppRoutes {
  const AppRoutes._();

  static const String splash = '/splash';
  static const String login = '/${RouteNames.login}';
  static const String signup = '/${RouteNames.signup}';

  static const String dashboard = '/${RouteNames.dashboard}';
}

class RouteNames {
  RouteNames._();
  static const String login = 'login';
  static const String signup = 'signup';

  static const String dashboard = 'dashboard';
}
