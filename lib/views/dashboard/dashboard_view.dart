import 'package:e_shop/di/di.dart';
import 'package:e_shop/providers/providers.dart';
import 'package:e_shop/res/res.dart';
import 'package:e_shop/views/views.dart';
import 'package:e_shop/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    super.initState();
    kGetIt<DashboardProvider>().getProducts();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppLogo.secondary(),
          actions: [
            IconButton(
              onPressed: context.read<AuthProvider>().logOut,
              icon: const Icon(
                Icons.logout_rounded,
                color: AppColors.white,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: Consumer<DashboardProvider>(
          builder: (_, provider, __) => provider.isLoading
              ? const AppLoader()
              : GridView.builder(
                  itemCount: provider.products.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.6,
                  ),
                  itemBuilder: (_, index) => ProductCard(provider.products[index]),
                ),
        ),
      );
}
