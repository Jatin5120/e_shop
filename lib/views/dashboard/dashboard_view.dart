import 'package:e_shop/providers/providers.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppLogo.secondary(),
          actions: [
            IconButton(
              onPressed: context.read<AuthProvider>().logOut,
              icon: const Icon(Icons.logout_rounded),
            ),
            const SizedBox(width: 12),
          ],
        ),
      );
}
