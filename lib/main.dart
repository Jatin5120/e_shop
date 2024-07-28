import 'package:e_shop/di/di.dart';
import 'package:e_shop/firebase_options.dart';
import 'package:e_shop/providers/providers.dart';
import 'package:e_shop/res/res.dart';
import 'package:e_shop/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => kGetIt<AuthProvider>()),
      ],
      child: const MyApp(),
    ),
  );
}

final kNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: Utility.hideKeyboard,
        child: MaterialApp.router(
          title: 'E-Shop',
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: AppTheme.theme,
        ),
      );
}
