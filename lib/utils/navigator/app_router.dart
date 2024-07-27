import 'package:e_shop/main.dart';
import 'package:e_shop/views/views.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

class AppRouter {
  AppRouter._();

  static GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    navigatorKey: kNavigatorKey,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (_, __) => const SplashView(),
      ),
      GoRoute(
        name: RouteNames.login,
        path: AppRoutes.login,
        builder: (_, __) => const LoginView(),
      ),
      GoRoute(
        name: RouteNames.signup,
        path: AppRoutes.signup,
        builder: (_, __) => const SignupView(),
      ),
      GoRoute(
        name: RouteNames.dashboard,
        path: AppRoutes.dashboard,
        builder: (_, __) => const DashboardView(),
      ),
    ],
  );
}
